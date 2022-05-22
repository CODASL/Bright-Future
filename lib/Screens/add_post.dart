import 'package:flutter/material.dart';

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
              const AddImages(),
              const GetPostIncludes(),
              PostButtonBar(formKey: _formKey),
            ],
          ),
        ),
      ),
    );
  }
}
