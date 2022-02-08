import 'package:brightfuture/Widgets/Add%20Post/add_img.dart';
import 'package:brightfuture/Widgets/Add%20Post/get_post_includes.dart';
import 'package:brightfuture/Widgets/Add%20Post/post_btn_bar.dart';
import 'package:brightfuture/Widgets/Custom%20App%20Bar/custom_app_bar.dart';
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
