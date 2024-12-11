import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentMethod extends StatelessWidget {
  final String name;
  final String cardNumber;

  PaymentMethod({
    required this.name,
    required this.cardNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: ListTile(
        title: Text(name),
        subtitle: Text(
          cardNumber,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w900,
          ),
        ),
        leading: Icon(
          FontAwesomeIcons.creditCard,
          size: 50.0,
          color: Theme.of(context).canvasColor,
        ),
        trailing: IconButton(
          onPressed: () {
            // Handle action
          },
          icon: Icon(Icons.keyboard_arrow_down),
        ),
      ),
    );
  }
}
