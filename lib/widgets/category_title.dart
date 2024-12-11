import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/categories_provider.dart';

class CategoryTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoriesProvider = Provider.of<CategoriesProvider>(context);

    return Text(
      "${categoriesProvider.currentCategory}",
      style: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}
