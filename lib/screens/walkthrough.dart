import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/walkthrough_provider.dart';

class Walkthrough extends StatelessWidget {
  final List<Map<String, dynamic>> pageInfos = [
    {
      "title": "Fresh Food",
      "body":
          "Freshly prepared, just for you!\nTaste the freshness in every bite 😋",
      "img": "assets/imgs/on1.png",
    },
    {
      "title": "Fast Delivery",
      "body": "From our kitchen to your door, fast and hot!",
      "img": "assets/imgs/on2.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();

    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount:
                      pageInfos.length + 1, // Add one for the third screen
                  itemBuilder: (context, index) {
                    if (index < pageInfos.length) {
                      return _buildPageModel(pageInfos[index], context);
                    } else {
                      return _buildPageModel2(context);
                    }
                  },
                ),
              ),
              _buildNavigationControls(context, pageController),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageModel(Map<String, dynamic> item, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          item['img'],
          height: 185.0,
        ),
        SizedBox(height: 30),
        Text(
          item['title'],
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        SizedBox(height: 20),
        Text(
          item['body'],
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15.0),
        ),
      ],
    );
  }

  Widget _buildPageModel2(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 35,
            ),
            Image(
              image: AssetImage('assets/imgs/on3.jpeg'),
              height: 185,
            ),
            SizedBox(height: 60),
            Text(
              'Easy Payment',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 28,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Fast, secure, and flexible payment methods: ',
              style: TextStyle(
                  fontSize: 20.0,
                  color: Theme.of(context).colorScheme.secondary),
            ),
            SizedBox(height: 60),
            SizedBox(
              height: 100, // Define a fixed height
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Image.asset(
                      'assets/imgs/PayPal.jpeg',
                      height: 100,
                      width: 130,
                    ),
                  ),
                  Flexible(
                    child: Image.asset(
                      'assets/imgs/bank-e.png',
                      height: 70,
                      width: 90,
                    ),
                  ),
                  Flexible(
                    child: Image.asset(
                      'assets/imgs/cards.png',
                      height: 100,
                      width: 130,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildNavigationControls(
      BuildContext context, PageController pageController) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            Provider.of<WalkthroughProvider>(context, listen: false)
                .navigateToJoin(context);
          },
          child: Text("Skip"),
        ),
        TextButton(
          onPressed: () async {
            if (pageController.page == pageInfos.length) {
              Provider.of<WalkthroughProvider>(context, listen: false)
                  .navigateToJoin(context);
            } else {
              pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          },
          child: Text(
            "Next",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ],
    );
  }
}
