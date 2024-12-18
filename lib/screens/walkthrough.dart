import 'package:flutter/material.dart';
import 'package:restaurant/screens/join.dart';

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
        backgroundColor: Colors.deepPurple[400], // Custom branding color
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: pageInfos.length +
                      2, // One extra for third screen and final page
                  itemBuilder: (context, index) {
                    if (index < pageInfos.length) {
                      return _buildPageModel(pageInfos[index], context);
                    } else if (index == pageInfos.length) {
                      return _buildPageModel2(context); // Third page screen
                    } else {
                      return _buildFinalPage(context); // Final page
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
        // Image with zoom effect
        AnimatedOpacity(
          opacity: 1.0,
          duration: Duration(seconds: 2),
          child: AnimatedScale(
            scale: 1.3,
            duration: Duration(seconds: 2),
            child: Image.asset(
              item['img'],
              height: 180.0,
            ),
          ),
        ),
        SizedBox(height: 30),
        // Title with animation
        AnimatedOpacity(
          opacity: 1.0,
          duration: Duration(seconds: 2),
          child: Text(
            item['title'],
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w600,
              color: Colors.white70,
            ),
          ),
        ),
        SizedBox(height: 20),
        // Description with animation
        AnimatedOpacity(
          opacity: 1.0,
          duration: Duration(seconds: 2),
          child: Text(
            item['body'],
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0, color: Colors.white70),
          ),
        ),
      ],
    );
  }

  Widget _buildFinalPage(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            opacity: 1.0,
            duration: Duration(seconds: 2),
            child: Text(
              'Get Started Now!',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
                color: Colors.white70,
              ),
            ),
          ),
          SizedBox(height: 30),
          // Button with fade-in effect
          AnimatedOpacity(
            opacity: 1.0,
            duration: Duration(seconds: 2),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: () {
                // Navigate to the home or main screen
                Navigator.of(context).push(_createRoute());
              },
              child: Text('Get Started'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationControls(
      BuildContext context, PageController pageController) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Skip button with fade effect
        AnimatedOpacity(
          opacity: 1.0,
          duration: Duration(seconds: 2),
          child: TextButton(
            onPressed: () {
              Navigator.of(context).push(_createRoute());
            },
            child: Text("Skip", style: TextStyle(color: Colors.white70)),
          ),
        ),
        // Next button with fade effect
        AnimatedOpacity(
          opacity: 1.0,
          duration: Duration(seconds: 2),
          child: TextButton(
            onPressed: () {
              if (pageController.page == pageInfos.length + 1) {
                // Transition animation when reaching the final page
                Navigator.of(context).push(_createRoute());
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
                color: Colors.white70,
              ),
            ),
          ),
        ),
      ],
    );
  }
  PageRouteBuilder _createPageRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0); // Start from below
        var end = Offset.zero; // End at the current position
        var curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => JoinScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
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
            // Animated image with zoom effect
            AnimatedOpacity(
              opacity: 1.0,
              duration: Duration(seconds: 2),
              child: AnimatedScale(
                scale: 1.5, // Increased scale for animation
                duration: Duration(seconds: 3),
                child: Image.asset(
                  'assets/imgs/on3.jpeg',
                  height: 200.0, // You can increase the height for bigger view
                ),
              ),
            ),

            SizedBox(height: 60),
            // Title
            AnimatedOpacity(
              opacity: 1.0,
              duration: Duration(seconds: 2),
              child: Text(
                'Easy Payment',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white70,
                ),
              ),
            ),
            SizedBox(height: 30),
            // Description
            AnimatedOpacity(
              opacity: 1.0,
              duration: Duration(seconds: 2),
              child: Text(
                'Fast, secure, and flexible payment methods: ',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0, color: Colors.white70),
              ),
            ),
            SizedBox(height: 60),
            // Payment method images in row
            SizedBox(
              height: 100, // Define a fixed height for the row
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
}
