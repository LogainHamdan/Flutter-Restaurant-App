import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/providers/dishes_provider.dart';
import '../widgets/badge.dart';
import '../widgets/grid_product.dart';
import 'notifications.dart';

class DishesScreen extends StatelessWidget {
  const DishesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final foodProvider = Provider.of<DishesProvider>(context);

    return Scaffold(
      backgroundColor: Colors.deepPurple[400],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_backspace,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "Dishes",
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: IconBadge(
              icon: Icons.notifications,
              size: 22.0,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return Notifications();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: <Widget>[
            // Fixed sized category display for Dishes
            buildCategory(context, DishesProvider().foods, 'African'),
            buildCategory(context, DishesProvider().foods, 'Chinese'),
            buildCategory(context, DishesProvider().foods, 'Italian'),
          ],
        ),
      ),
    );
  }

  Widget buildCategory(
      BuildContext context, List<Map> foodList, String category) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        const Divider(),
        SizedBox(
          height: 250, // Fixed height to constrain GridView
          child: GridView.builder(
            shrinkWrap: true,
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),
            itemCount: foodList.length,
            itemBuilder: (BuildContext context, int index) {
              final food = foodList[index];
              return GridProduct(
                img: food['img'],
                isFav: false,
                name: food['name'],
                rating: 5.0,
                raters: 23,
              );
            },
          ),
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
