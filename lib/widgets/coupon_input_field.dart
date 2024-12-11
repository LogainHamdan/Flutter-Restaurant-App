import 'package:flutter/material.dart';

class CouponInputField extends StatelessWidget {
  final TextEditingController controller;

  CouponInputField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: TextField(
          style: TextStyle(fontSize: 15.0, color: Colors.black),
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(color: Colors.grey[200]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[200]!),
              borderRadius: BorderRadius.circular(5.0),
            ),
            hintText: "Coupon Code",
            prefixIcon: Icon(
              Icons.redeem,
              color: Theme.of(context).canvasColor,
            ),
          ),
        ),
      ),
    );
  }
}
