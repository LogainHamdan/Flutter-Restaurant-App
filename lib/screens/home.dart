import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../providers/home_provider.dart';
import '../util/categories.dart';
import '../util/foods.dart';
import '../widgets/grid_product.dart';
import '../widgets/home_category.dart';
import '../widgets/slider_item.dart';
import 'dishes.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: Scaffold(
        backgroundColor: Colors.deepPurple[400],
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ListView(
            children: <Widget>[
              // Section 1: Dishes Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    "Dishes",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  ElevatedButton(
                    child: Text(
                      "View More",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return DishesScreen();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10.0),

              // Section 2: Slider with Provider
              Consumer<HomeProvider>(
                builder: (context, homeProvider, child) {
                  if (foods == null || foods.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return SizedBox(
                    height: 200, // Fixed height to constrain the slider
                    child: PageView.builder(
                      controller: PageController(viewportFraction: 1.0),
                      onPageChanged: (index) {
                        homeProvider.setCurrentPageIndex(index);
                      },
                      itemCount: foods.length,
                      itemBuilder: (context, index) {
                        final Map food = foods[index];
                        return SliderItem(
                          img: food['img'] ?? '',
                          isFav: false,
                          name: food['name'] ?? '',
                          rating: 5.0,
                          raters: 23,
                        );
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: 20.0),

              const Text(
                "Food Categories",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 10.0),

              // Fixed height for horizontal scrolling ListView
              SizedBox(
                height: 100, // Constrain height here
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Map cat = categories[index];
                    return HomeCategory(
                      icon: cat['icon'],
                      title: cat['name'],
                      items: cat['items'].toString(),
                      isHome: true,
                    );
                  },
                ),
              ),
              const SizedBox(height: 20.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    "Popular Items",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),

              // Grid for Popular Items
              GridView.builder(
                shrinkWrap: true,
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                ),
                itemCount: foods.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  final Map food = foods[index];
                  return GridProduct(
                    img: food['img'] ?? '',
                    isFav: false,
                    name: food['name'] ?? '',
                    rating: 5.0,
                    raters: 23,
                  );
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
