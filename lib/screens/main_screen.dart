import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/main_screen_provider.dart';
import '../util/const.dart';
import '../widgets/badge.dart';
import 'cart.dart';
import 'favorite_screen.dart';
import 'home.dart';
import 'notifications.dart';
import 'profile.dart';
import 'search.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mainScreenController = Provider.of<MainScreenController>(context);

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.deepPurple[400],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            Constants.appName,
          ),
          elevation: 0.0,
          actions: [
            IconButton(
              icon: IconBadge(
                icon: Icons.notifications,
                size: 22.0,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Notifications()),
                );
              },
              tooltip: "Notifications",
            ),
          ],
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: mainScreenController.pageController,
          children: <Widget>[
            Home(),
            FavoriteScreen(),
            SearchScreen(),
            CartScreen(),
            Profile(),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 7),
              IconButton(
                icon: Icon(Icons.home, size: 24.0),
                color: mainScreenController.currentPageIndex == 0
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).textTheme.bodySmall!.color,
                onPressed: () => mainScreenController.setPage(0),
              ),
              IconButton(
                icon: Icon(Icons.favorite, size: 24.0),
                color: mainScreenController.currentPageIndex == 1
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).textTheme.bodySmall!.color,
                onPressed: () => mainScreenController.setPage(1),
              ),
              IconButton(
                icon: Icon(Icons.search, size: 24.0),
                color: mainScreenController.currentPageIndex == 2
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).textTheme.bodySmall!.color,
                onPressed: () => mainScreenController.setPage(2),
              ),
              IconButton(
                icon: IconBadge(
                  icon: Icons.shopping_cart,
                  size: 24.0,
                ),
                color: mainScreenController.currentPageIndex == 3
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).textTheme.bodySmall!.color,
                onPressed: () => mainScreenController.setPage(3),
              ),
              IconButton(
                icon: Icon(Icons.person, size: 24.0),
                color: mainScreenController.currentPageIndex == 4
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).textTheme.bodySmall!.color,
                onPressed: () => mainScreenController.setPage(4),
              ),
              SizedBox(width: 7),
            ],
          ),
          color: Theme.of(context).primaryColor,
          shape: CircularNotchedRectangle(),
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          elevation: 4.0,
          child: Icon(Icons.search),
          onPressed: () => mainScreenController.setPage(2),
        ),
      ),
    );
  }
}
