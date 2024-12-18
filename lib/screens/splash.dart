import 'package:custom_circular_progress/custom_circular_progress.dart';
import 'package:custom_circular_progress/utils.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/screens/walkthrough.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simulate loading for 3 seconds, then navigate to the walkthrough screen
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Walkthrough()));
    });
    return Scaffold(
      backgroundColor:
          Colors.deepPurple[400], // Custom brand color for background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated logo
            // AnimatedOpacity(
            //   opacity: 1.0,
            //   duration: Duration(seconds: 2),
            //   child: AnimatedScale(
            //     scale: 1.5,
            //     duration: Duration(seconds: 2),
            //     child: Icon(
            //       Icons.fastfood,
            //       size: 180.0,
            //       color: Colors.white,
            //     ),
            //   ),
            // ),
            AnimatedOpacity(
              opacity: 1,
              duration: Duration(seconds: 2),
              child: AnimatedScale(
                scale: 1.5,
                duration: Duration(seconds: 2),
                child: Icon(
                  Icons.fastfood_rounded,
                  size: 180,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 40),
            Text(
              'Restaurant',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 40),
            CustomCircularProgress(
              details: IndicatorDetails(value: 0.2, itemCount: 10),
              color: Colors.blue,
              // Add more customizations here

              // Loading indicator
              // SpinKitFadingCircle(
              //   color: Colors.white,
              //   size: 50.0,
              // ),
            )
          ],
        ),
      ),
    );
  }
}
