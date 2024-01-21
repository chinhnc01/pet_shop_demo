import 'package:flutter/material.dart';
import 'package:pet_shop/widgets/text_custom.dart';

InputDecoration textFieldInputStyle(
    {required String label, Widget? prefixIcon, Widget? suffixIcon}) {
  return InputDecoration(
    //helperText: 'Helper Text',
    //counterText: '0 characters',
    label: textBodyMedium(text: label, color: Colors.grey),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
    ),
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
  );
}
