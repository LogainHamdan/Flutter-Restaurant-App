import 'package:flutter/material.dart';

Widget customElevatedButton({
  required VoidCallback onPressed,
  required String text,
}) {
  return ElevatedButton(
    style: ButtonStyle(
      fixedSize: MaterialStateProperty.all(Size(300, 50)),
      elevation: MaterialStateProperty.all(10),
      backgroundColor: MaterialStateProperty.all(
          Colors.deepPurple[400]), // Update to `kprimaryColor` if required
      shadowColor: MaterialStateProperty.all(Colors.black),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    ),
    onPressed: onPressed,
    child: Text(
      text,
      style: TextStyle(color: Colors.white, fontSize: 20),
    ),
  );
}
