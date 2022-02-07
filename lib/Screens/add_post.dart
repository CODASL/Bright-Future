import 'package:brightfuture/Models/screen_size.dart';
import 'package:brightfuture/Widgets/Custom%20App%20Bar/custom_app_bar.dart';
import 'package:brightfuture/Widgets/Custom%20Button/custom_button.dart';
import 'package:brightfuture/Widgets/Custom%20Text%20Field/custom_textfield.dart';
import 'package:flutter/material.dart';

class AddPost extends StatelessWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Add a Post", context: context),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            AddImages(),
            GetPostIncludes(),
            PostButtonBar(),
          ],
        ),
      ),
    );
  }
}

class AddImages extends StatelessWidget {
  const AddImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenSize.height * 0.4,
      width: ScreenSize.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Material(
            elevation: 5,
            child: Container(
              child: const Center(
                child: Icon(Icons.add_a_photo),
              ),
              width: ScreenSize.width * 0.4,
              height: ScreenSize.height * 0.3,
              color: Colors.white,
            ),
          ),
          Material(
            elevation: 5,
            child: Container(
              child: const Center(
                child: Icon(Icons.add_a_photo),
              ),
              width: ScreenSize.width * 0.4,
              height: ScreenSize.height * 0.3,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class GetPostIncludes extends StatelessWidget {
  const GetPostIncludes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 40,
        bottom: 40,
        left: ScreenSize.width * 0.05,
        right: ScreenSize.width * 0.05,
      ),
      child: Column(
        children: const [
          CustomTextField(label: "Head", isPassword: false),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            label: "Body",
            isPassword: false,
            maxLines: 5,
            maxLength: 100,
          ),
        ],
      ),
    );
  }
}

class PostButtonBar extends StatelessWidget {
  const PostButtonBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomButton(
            label: "Add Post",
            height: 50,
            minWidth: ScreenSize.width * 0.35,
            radius: 20),
        CustomButton(
            label: "Reset",
            height: 50,
            minWidth: ScreenSize.width * 0.35,
            radius: 20),
      ],
    );
  }
}
