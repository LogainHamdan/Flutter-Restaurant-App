import 'package:flutter/material.dart';

class RegisterProvider with ChangeNotifier {
  String _username = '';
  String _email = '';
  String _password = '';

  // Setters for handling text field changes
  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  // Getter methods to access the current state
  String get username => _username;
  String get email => _email;
  String get password => _password;

  void register() {
    // You can add registration logic here
    print('Username: $_username');
    print('Email: $_email');
    print('Password: $_password');
    // Simulate user registration logic
  }
}
