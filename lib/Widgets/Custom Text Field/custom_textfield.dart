import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool isPassword;
  final String label;
  final int? maxLines;
  final int? maxLength;
  final String? suffixText;
  final void Function(String)? onChanged;
  const CustomTextField({
    Key? key,
    required this.label,
    required this.isPassword,
    this.controller,
    this.maxLines,
    this.maxLength,
    this.suffixText, this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged:onChanged ,
      maxLength: maxLength,
      maxLines: maxLines ?? 1,
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        suffixText: suffixText,
        suffixStyle: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
