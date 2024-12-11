import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/categories_provider.dart';
import '../util/categories.dart';
import '../widgets/home_category.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoriesProvider = Provider.of<CategoriesProvider>(context);

    return Container(
      height: 65.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          Map cat = categories[index];
          return HomeCategory(
            icon: cat['icon'],
            title: cat['name'],
            items: cat['items'].toString(),
            isHome: false,
            tap: () {
              categoriesProvider.setCategory("${cat['name']}");
            },
          );
        },
      ),
    );
  }
}
