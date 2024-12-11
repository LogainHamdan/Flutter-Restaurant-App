import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/details_provider.dart'; // Import ProductProvider
import 'smooth_star_rating.dart'; // Assuming this is a custom widget for star ratings

class ProductTitleAndRating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "${productProvider.productName}", // Accessing productName from ProductProvider
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
          maxLines: 2,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 5.0, top: 2.0),
          child: Row(
            children: <Widget>[
              SmoothStarRating(
                starCount: 5,
                color: Colors.orange,
                allowHalfRating: true,
                rating: 5.0,
                size: 10.0,
              ),
              SizedBox(width: 10.0),
              Text(
                "5.0 (23 Reviews)",
                style: TextStyle(
                  fontSize: 11.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
