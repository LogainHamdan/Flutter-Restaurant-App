import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../providers/walkthrough_provider.dart';

class Walkthrough extends StatelessWidget {
  final List<Map<String, String>> pageInfos = [
    {
      "title": "Fresh Food",
      "body":
          "Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus.",
      "img": "assets/on1.png",
    },
    {
      "title": "Fast Delivery",
      "body":
          "Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus.",
      "img": "assets/on2.png",
    },
    {
      "title": "Easy Payment",
      "body":
          "Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus.",
      "img": "assets/on3.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<PageViewModel> pages =
        pageInfos.map((item) => _buildPageModel(item, context)).toList();

    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: IntroductionScreen(
            pages: pages,
            onDone: () =>
                Provider.of<WalkthroughProvider>(context, listen: false)
                    .navigateToJoin(context),
            onSkip: () =>
                Provider.of<WalkthroughProvider>(context, listen: false)
                    .navigateToJoin(context),
            showSkipButton: true,
            skip: Text("Skip"),
            next: Text(
              "Next",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            done: Text(
              "Done",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  static PageViewModel _buildPageModel(
      Map<String, String> item, BuildContext context) {
    return PageViewModel(
      title: item['title']!,
      body: item['body']!,
      image: Image.asset(
        item['img']!,
        height: 185.0,
      ),
      decoration: PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.secondary,
        ),
        bodyTextStyle: TextStyle(fontSize: 15.0),
        pageColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
