import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../util/foods.dart';
import '../widgets/cart_item.dart';
import 'checkout.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView.builder(
          itemCount: cartProvider.cartItems.length,
          itemBuilder: (BuildContext context, int index) {
            final food = cartProvider.cartItems[index];
            return CartItem(
              img: food['img'],
              isFav: false,
              name: food['name'],
              rating: 5.0,
              raters: 23,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Checkout",
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => Checkout(),
            ),
          );
        },
        child: Icon(
          Icons.arrow_forward,
        ),
        heroTag: Object(),
      ),
    );
  }
}
