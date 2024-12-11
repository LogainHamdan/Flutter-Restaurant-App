import 'package:flutter/material.dart';

class ShippingAddress extends StatelessWidget {
  final String name;
  final String address;

  ShippingAddress({
    required this.name,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Shipping Address",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            IconButton(
              onPressed: () {
                // Handle edit action
              },
              icon: Icon(Icons.edit),
            ),
          ],
        ),
        SizedBox(height: 10.0),
        ListTile(
          title: Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.w900,
            ),
          ),
          subtitle: Text(address),
        ),
      ],
    );
  }
}
