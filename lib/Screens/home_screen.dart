import 'package:brightfuture/Models/screen_size.dart';
import 'package:brightfuture/Widgets/Custom%20Text%20Field/custom_textfield.dart';
import 'package:brightfuture/Widgets/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Models/post.dart';
import '../Services/Database/post_handeling.dart';
import '../Widgets/CustomText/custom_text.dart';
import '../Widgets/Post Widget/post_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: ScreenSize.height * 0.03,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenSize.width * 0.02,
          ),
          child: CustomTextField(
            prefixIcon: const Icon(FontAwesomeIcons.search
            ),
            hintText: 'Search posts',
            borderSide: BorderSide.none,
            radius: ScreenSize.width * 0.5,
            filled: true,
            fillColor: const Color(0xffeeeeee),
          ),
        ),
        SizedBox(
          height: ScreenSize.height * 0.03,
        ),
        StreamBuilder<QuerySnapshot>(
          stream: PostHandling.getPosts(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: CustomText(title: "Something went wrong"),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingWidget();
            }

            return ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return EntirePost(
                  post: Post.fromMap(data),
                  ref: document.reference.id,
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}
