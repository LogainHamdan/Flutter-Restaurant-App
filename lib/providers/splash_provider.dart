import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant/screens/walkthrough.dart';
import '../util/const.dart';

class SplashProvider with ChangeNotifier {
  Timer? _timer;

  void initializeSplashScreen(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    _startTimeout(context);
  }

  void _startTimeout(BuildContext context) {
    _timer = Timer(Duration(seconds: 2), () => _navigateToWalkthrough(context));
  }

  void _navigateToWalkthrough(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => Walkthrough()),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
