import 'package:flutter/material.dart';

Widget customTextFormField({
  required TextEditingController controller,
  required String labelText,
  TextInputType keyboardType = TextInputType.text,
  bool obscureText = false,
  String? Function(String?)? validator,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    obscureText: obscureText,
    validator: validator,
    style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
    decoration: InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(fontSize: 18, color: Colors.grey),
    ),
  );
}
