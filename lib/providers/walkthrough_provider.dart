import 'package:flutter/material.dart';
import 'package:restaurant/screens/join.dart';

class WalkthroughProvider with ChangeNotifier {
  void navigateToJoin(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => JoinScreen()),
    );
  }
}
