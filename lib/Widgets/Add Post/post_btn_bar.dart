import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Models/screen_size.dart';
import '../../Providers/add_post_controller.dart';
import '../Custom Button/custom_button.dart';

class PostButtonBar extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const PostButtonBar({Key? key, required this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddPostController>(
      builder: (context, ctrl, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    await ctrl.createPost(context);
                  }
                },
                label: "Add Post",
                height: 50,
                minWidth: ScreenSize.width * 0.85,
                radius: 20),
          ],
        );
      },
    );
  }
}
