import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/details_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductImageWithFavorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Stack(children: <Widget>[
      Container(
        height: MediaQuery.of(context).size.height / 3.2,
        width: MediaQuery.of(context).size.width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            "assets/food1.jpg", // Adjust this to dynamic image path
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(
        right: -10.0,
        bottom: 3.0,
        child: RawMaterialButton(
          onPressed: () => productProvider.toggleFavorite(),
          fillColor: Colors.white,
          shape: CircleBorder(),
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Icon(
              productProvider.isFav ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
              size: 17,
            ),
          ),
        ),
      ),
    ]);
  }
}
