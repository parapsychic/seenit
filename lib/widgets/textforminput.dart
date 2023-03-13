import 'package:flutter/material.dart';

class TextFormInput extends StatelessWidget {
  final TextEditingController controller;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  final int maxLines;
  final bool isNumber;
  final TextStyle style;
  Widget? prefix;
  int? maxLength;

  TextFormInput(
      {Key? key,
      required this.controller,
      this.isPass = false,
      required this.hintText,
      this.textInputType = TextInputType.text,
      this.maxLines = 1,
      this.prefix,
      this.isNumber = false,
      this.maxLength,
      this.style = const TextStyle(color: Colors.black)})
      : super(key: key);

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
        borderSide: Divider.createBorderSide(context, color: Colors.blue));
    return TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is mandatory';
          }

          if (isNumber && !isNumeric(value)) {
            return 'Numeric value expected';
          }
          return null;
        },
        controller: controller,
        decoration: InputDecoration(
          prefix: prefix,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
          border: inputBorder,
          enabledBorder: inputBorder,
          filled: true,
          contentPadding: const EdgeInsets.all(8),
        ),
        keyboardType: textInputType,
        obscureText: isPass,
        maxLines: maxLines,
        maxLength: maxLength,
        style: style);
  }
}
