import 'package:flutter/material.dart';

class PlaceOrderButton extends StatelessWidget {
  final Function()? onPressed;

  PlaceOrderButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 5, 10, 5),
      width: 150.0,
      height: 50.0,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black),
        ),
        child: Text(
          "Place Order".toUpperCase(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
