import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool isPassword;
  final String? label;
  final int? maxLines;
  final int? maxLength;
  final String? suffixText;
  final void Function(String)? onChanged;
  final String? initialValue;
  final String? Function(String?)? validator;
  final Color? fillColor;
  final bool? filled;
  final BorderSide? borderSide;
  final Icon? prefixIcon;
  final double? radius;

  final String? hintText;
  const CustomTextField({
    Key? key,
    this.label,
    this.isPassword = false,
    this.controller,
    this.maxLines,
    this.maxLength,
    this.suffixText,
    this.onChanged,
    this.initialValue,
    this.validator,
    this.fillColor,
    this.filled,
    this.radius,
    this.borderSide,
    this.hintText,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      initialValue: initialValue,
      onChanged: onChanged,
      maxLength: maxLength,
      maxLines: maxLines ?? 1,
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText,
        filled: filled,
        fillColor: fillColor,
        labelText: label,
        border: OutlineInputBorder(
          borderSide: borderSide ?? const BorderSide(),
          borderRadius: BorderRadius.circular(radius ?? 0),
        ),
        suffixText: suffixText,
        suffixStyle: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
