import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/screens/register.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_textform_field.dart';
import 'home.dart';

class Login extends StatefulWidget {
  static const String id = '/login';
  final int selectedTab;

  const Login({super.key, required this.selectedTab});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController emailController;
  late TextEditingController passController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            customTextFormField(
              controller: emailController,
              labelText: 'Email Address',
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Your Email Address';
                } else if (!EmailValidator.validate(value)) {
                  return 'Please Enter a valid Email';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            customTextFormField(
              controller: passController,
              labelText: 'Password',
              obscureText: true,
            ),
            const SizedBox(height: 20),
            customElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              text: 'Login',
            ),
            SizedBox(height: 20),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MaterialApp(
                                home: Scaffold(
                                  body: Register(
                                    selectedTab: 0,
                                  ),
                                ),
                              )));
                },
                child: Text(
                  'Create an account',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                ))
          ],
        ),
      ),
    );
  }
}
