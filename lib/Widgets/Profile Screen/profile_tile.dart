import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  final String title;
  final FontWeight? fontWeight;
  final double? fontSize;
  const ProfileListTile(
      {Key? key, required this.title, this.fontWeight, this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Center(
          child: Text(
        title,
        style: TextStyle(fontWeight: fontWeight, fontSize: fontSize),
      )),
    );
  }
}