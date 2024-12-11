import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../util/foods.dart';
import '../widgets/grid_product.dart';
import '../providers/favorite_provider.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: Consumer<FavoriteProvider>(
          builder: (context, favoriteProvider, child) => ListView(
            children: <Widget>[
              SizedBox(height: 10.0),
              Text(
                "My Favorite Items",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 10.0),
              GridView.builder(
                shrinkWrap: true,
                primary: false,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.25),
                ),
                itemCount: favoriteProvider.foods.length,
                itemBuilder: (context, index) {
                  final food = favoriteProvider.foods[index];
                  return GridProduct(
                    img: food['img'],
                    isFav: true,
                    name: food['name'],
                    rating: 5.0,
                    raters: 23,
                  );
                },
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
