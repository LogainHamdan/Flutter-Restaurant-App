import 'package:flutter/material.dart';

class OrderSummary extends StatelessWidget {
  final String totalAmount;

  OrderSummary({required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Total",
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          r"$ $totalAmount",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w900,
            color: Theme.of(context).canvasColor,
          ),
        ),
        Text(
          "Delivery charges included",
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
