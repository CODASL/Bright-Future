import 'package:brightfuture/Models/screen_size.dart';
import 'package:brightfuture/Widgets/Custom%20Button/custom_button.dart';
import 'package:flutter/material.dart';

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
