import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/screen_size.dart';
import '../Providers/home_screen_controller.dart';
import '../Services/Database/post_handeling.dart';
import '../Widgets/Custom Text Field/custom_textfield.dart';
import '../Widgets/CustomText/custom_text.dart';
import '../Widgets/Post Widget/post_widget.dart';
import '../Widgets/loading.dart';
import '../constant/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final ctrl = Provider.of<HomeScreenController>(context, listen: false);
    ctrl.loadAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenController>(
      builder: (context, ctrl, child) {
        return Column(
          children: [
            SizedBox(
              height: ScreenSize.height * 0.03,
            ),
            PostSearchTextField(
              ctrl: ctrl,
            ),
            SizedBox(
              height: ScreenSize.height * 0.03,
            ),
            StreamBuilder<QuerySnapshot>(
              stream: PostHandling.getPosts(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: CustomText(title: "Something went wrong"),
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LoadingWidget();
                }
                print(snapshot.data?.docs.length);
                ctrl.loadPosts(snapshot);
                if (ctrl.foundData.isNotEmpty) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: ctrl.foundData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return EntirePost(
                        post: ctrl.foundData[index].post,
                        ref: ctrl.foundData[index].ref,
                      );
                    },
                  );
                } else {
                  return SizedBox(
                    height: ScreenSize.height * 0.6,
                    child: const Align(
                        alignment: Alignment.center,
                        child: CustomText(title: "No search result found !")),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}

class PostSearchTextField extends StatelessWidget {
  final HomeScreenController ctrl;
  const PostSearchTextField({Key? key, required this.ctrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenSize.width * 0.03,
      ),
      child: CustomTextField(
        suffix: SizedBox(
          width: ScreenSize.width * 0.15,
          child: InkWell(
            onTap: (() => showDialog(
                context: context, builder: (_) => const AlertDialog())),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const CustomText(title: "Filter"),
                Icon(Icons.filter_alt_rounded, color: primaryColor),
              ],
            ),
          ),
        ),
        onChanged: (String? searchText) {
          ctrl.searchPosts(searchText);
        },
        prefixIcon: const Icon(Icons.search),
        hintText: 'Search by user name',
        borderSide: BorderSide.none,
        radius: ScreenSize.width * 0.5,
        filled: true,
        fillColor: const Color(0xffeeeeee),
      ),
    );
  }
}
