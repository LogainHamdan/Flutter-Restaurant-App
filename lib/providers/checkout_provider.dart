import 'package:flutter/material.dart';
import '../util/foods.dart';

class CheckoutProvider with ChangeNotifier {
  TextEditingController couponController = TextEditingController();

  // Example cart list
  List<Map<dynamic, dynamic>> cartItems = foods;

  // Placeholder total amount
  String totalAmount = "212";

  // Update coupon logic (add logic here if you want dynamic coupon effects)
  void setCoupon(String coupon) {
    couponController.text = coupon;
    notifyListeners();
  }

  @override
  void dispose() {
    couponController.dispose();
    super.dispose();
  }
}
