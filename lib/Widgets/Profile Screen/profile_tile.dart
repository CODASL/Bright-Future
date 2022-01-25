import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  final String title;
  final FontWeight? fontWeight;
  final double? fontSize;
  final String subtitle;
  const ProfileListTile(
      {Key? key,
      required this.title,
      this.fontWeight,
      this.fontSize,
       this.subtitle = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Center(
          child: Text(
        title,
        style: TextStyle(fontWeight: fontWeight, fontSize: fontSize),
      )),
      subtitle: Center(
        child: Text(subtitle),
      ),
    );
  }
}
