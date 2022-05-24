import 'package:brightfuture/Providers/my_post_controller.dart';
import 'package:brightfuture/Widgets/CustomText/custom_text.dart';
import 'package:brightfuture/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../Models/screen_size.dart';
import '../Widgets/Add Post/add_img.dart';
import '../Widgets/Add Post/get_post_includes.dart';
import '../Widgets/Add Post/post_btn_bar.dart';
import '../Widgets/Custom App Bar/custom_app_bar.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Add a Post", context: context),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const PostTypeSelection(),
              const AddImages(),
              const GetPostIncludes(),
              const AddLocation(),
              PostButtonBar(formKey: _formKey),
            ],
          ),
        ),
      ),
    );
  }
}

class PostTypeSelection extends StatelessWidget {
  const PostTypeSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MyPostController>(
      builder: (context, ctrl, child) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenSize.width * 0.03,
              vertical: ScreenSize.height * 0.01),
          child: ListTile(
            title: const CustomText(title: "Post Type"),
            leading: Icon(
              FontAwesomeIcons.gift,
              color: primaryColor,
            ),
            trailing: DropdownButton(
              value: ctrl.dropdownvalue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: ctrl.items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                ctrl.setPostType(newValue);
              },
            ),
          ),
        );
      },
    );
  }
}

class AddLocation extends StatelessWidget {
  const AddLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: ScreenSize.height * 0.03,
        left: ScreenSize.width * 0.05,
        right: ScreenSize.width * 0.05,
      ),
      child: ListTile(
        onTap: () {},
        leading: Icon(
          FontAwesomeIcons.locationArrow,
          color: primaryColor,
        ),
        title: const CustomText(title: "Select Location"),
      ),
    );
  }
}
