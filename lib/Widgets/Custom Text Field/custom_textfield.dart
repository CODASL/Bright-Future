import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final bool isPassword;
  final String label;
  const CustomTextField(
      {Key? key, required this.label, required this.isPassword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      decoration:
          InputDecoration(labelText: label, border: const OutlineInputBorder()),
    );
  }
}
