import 'package:brightfuture/Models/screen_size.dart';
import 'package:brightfuture/Widgets/Custom%20Text%20Field/custom_textfield.dart';
import 'package:flutter/material.dart';

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