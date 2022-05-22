import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/screen_size.dart';
import '../../Providers/add_post_controller.dart';
import '../Custom Text Field/custom_textfield.dart';

class GetPostIncludes extends StatelessWidget {
  const GetPostIncludes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddPostController>(
      builder: (context, ctrl, child) {
        return Padding(
          padding: EdgeInsets.only(
            top: 40,
            bottom: 40,
            left: ScreenSize.width * 0.05,
            right: ScreenSize.width * 0.05,
          ),
          child: CustomTextField(
            validator: (val) {
              if (val == null || val.length < 50) {
                return "Body must have more than at least 50 characters ";
              }
              return null;
            },
            onChanged: (String postBody) {
              ctrl.postBodyOnChange(postBody);
            },
            label: "Body",
            isPassword: false,
            maxLines: 9,
            maxLength: 100,
          ),
        );
      },
    );
  }
}
