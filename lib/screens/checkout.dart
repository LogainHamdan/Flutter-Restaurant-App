import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/checkout_provider.dart';
import '../widgets/cart_item.dart';
import '../widgets/coupon_input_field.dart';
import '../widgets/order_summary.dart';
import '../widgets/payment_method.dart';
import '../widgets/place_order_button.dart';
import '../widgets/shipping_address.dart';

class Checkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Checkout",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w800,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            tooltip: "Back",
            icon: Icon(
              Icons.clear,
              color: Theme.of(context).shadowColor,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 130),
        child: Consumer<CheckoutProvider>(
          builder: (context, provider, child) {
            return ListView(
              children: <Widget>[
                ShippingAddress(
                  name: "John Doe",
                  address: "1278 Loving Acres Road Kansas City, MO 64110",
                ),

                PaymentMethod(
                  name: "John Doe",
                  cardNumber: "5506 7744 8610 9638",
                ),
                CouponInputField(controller: provider.couponController),
                OrderSummary(totalAmount: provider.totalAmount.toString()),
                // Cart items should be dynamically rendered from provider
                ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: provider.cartItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    final food = provider.cartItems[index];
                    return CartItem(
                      img: food['img'],
                      isFav: false,
                      name: food['name'],
                      rating: 5.0,
                      raters: 23,
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
      bottomSheet: Consumer<CheckoutProvider>(
        builder: (context, provider, child) {
          return PlaceOrderButton(
            onPressed: () {
              // Handle place order action
            },
          );
        },
      ),
    );
  }
}
