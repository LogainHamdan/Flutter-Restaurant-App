import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/providers/app_provider.dart';
import 'package:restaurant/providers/cart_provider.dart';
import 'package:restaurant/providers/categories_provider.dart';
import 'package:restaurant/providers/checkout_provider.dart';
import 'package:restaurant/providers/details_provider.dart';
import 'package:restaurant/providers/dishes_provider.dart';
import 'package:restaurant/providers/favorite_provider.dart';
import 'package:restaurant/providers/home_provider.dart';
import 'package:restaurant/providers/login_provider.dart';
import 'package:restaurant/providers/main_screen_provider.dart';
import 'package:restaurant/providers/notification_provider.dart';
import 'package:restaurant/providers/profile_provider.dart';
import 'package:restaurant/providers/register_provider.dart';
import 'package:restaurant/providers/search_provider.dart';
import 'package:restaurant/providers/splash_provider.dart';
import 'package:restaurant/providers/tab_controller_provider.dart';
import 'package:restaurant/providers/walkthrough_provider.dart';
import 'package:restaurant/screens/home.dart';
import 'package:restaurant/screens/splash.dart';

import 'util/const.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (BuildContext context, AppProvider appProvider, Widget? child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => HomeProvider()),
            ChangeNotifierProvider(create: (_) => AppProvider()),
            ChangeNotifierProvider(create: (_) => CartProvider()),
            ChangeNotifierProvider(create: (_) => CategoriesProvider()),
            ChangeNotifierProvider(create: (_) => CheckoutProvider()),
            ChangeNotifierProvider(create: (_) => ProductProvider()),
            ChangeNotifierProvider(create: (_) => DishesProvider()),
            ChangeNotifierProvider(create: (_) => FavoriteProvider()),
            ChangeNotifierProvider(create: (_) => HomeProvider()),
            ChangeNotifierProvider(create: (_) => LoginProvider()),
            ChangeNotifierProvider(create: (_) => MainScreenController()),
            ChangeNotifierProvider(create: (_) => NotificationProvider()),
            ChangeNotifierProvider(create: (_) => ProfileProvider()),
            ChangeNotifierProvider(create: (_) => RegisterProvider()),
            ChangeNotifierProvider(create: (_) => SearchProvider()),
            ChangeNotifierProvider(create: (_) => SplashProvider()),
            // ChangeNotifierProvider(
            //     create: (_) => TabControllerProvider(vsync: null)),
            ChangeNotifierProvider(create: (_) => WalkthroughProvider()),
          ],
          child: MaterialApp(
            key: appProvider.key,
            debugShowCheckedModeBanner: false,
            navigatorKey: appProvider.navigatorKey,
            title: Constants.appName,
            theme: appProvider.theme,
            darkTheme: Constants.darkTheme,
            home: SplashScreen(),
          ),
        );

        //
        //   MaterialApp(
        //   key: appProvider.key,
        //   debugShowCheckedModeBanner: false,
        //   navigatorKey: appProvider.navigatorKey,
        //   title: Constants.appName,
        //   theme: appProvider.theme,
        //   darkTheme: Constants.darkTheme,
        //   home: SplashScreen(),
        // );
      },
    );
  }
}
