import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String title;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;
  final TextAlign? textAlign;
  const CustomText(
      {Key? key,
      required this.title,
      this.fontWeight,
      this.color,
      this.fontSize,  this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style:
          TextStyle(fontWeight: fontWeight, color: color, fontSize: fontSize),
      textAlign: textAlign,
    );
  }
}
