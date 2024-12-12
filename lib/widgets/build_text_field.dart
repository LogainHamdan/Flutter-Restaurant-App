import 'package:flutter/material.dart';

class build_text_field extends StatelessWidget {
  const build_text_field({
    super.key,
    required this.context,
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.isPassword,
  });

  final BuildContext context;
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: TextField(
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(color: Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(5.0),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
                fontSize: 15.0,
                color: Colors.black,
                fontWeight: FontWeight.w100),
            prefixIcon: Icon(
              icon,
              color: Colors.black,
            ),
          ),
          obscureText: isPassword,
          maxLines: 1,
          controller: controller,
        ),
      ),
    );
  }
}
