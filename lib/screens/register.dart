import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_textform_field.dart';
import 'home.dart';

class Register extends StatefulWidget {
  static const String id = '/register';

  final int selectedTab;
  const Register({super.key, required this.selectedTab});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late TextEditingController firstNameController;
  late TextEditingController surnameController;
  late TextEditingController userNameController;
  late TextEditingController emailController;
  late TextEditingController numberController;
  late TextEditingController passController;
  late TextEditingController confPassController;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    surnameController = TextEditingController();
    userNameController = TextEditingController();
    emailController = TextEditingController();
    numberController = TextEditingController();
    passController = TextEditingController();
    confPassController = TextEditingController();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    surnameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    numberController.dispose();
    passController.dispose();
    confPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80.0),
        child: Column(
          children: [
            customTextFormField(
              controller: firstNameController,
              labelText: 'First Name',
            ),
            const SizedBox(height: 15),
            customTextFormField(
              controller: surnameController,
              labelText: 'Surname',
            ),
            const SizedBox(height: 15),
            customTextFormField(
              controller: userNameController,
              labelText: 'Username',
            ),
            const SizedBox(height: 15),
            customTextFormField(
              controller: emailController,
              labelText: 'Email Address',
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter your Email Address';
                } else if (!EmailValidator.validate(value)) {
                  return 'Please Enter a valid Email Address';
                }
                return null;
              },
            ),
            const SizedBox(height: 8),
            customTextFormField(
              controller: numberController,
              labelText: 'Phone Number',
            ),
            const SizedBox(height: 8),
            customTextFormField(
              controller: passController,
              labelText: 'Password',
              obscureText: true,
            ),
            const SizedBox(height: 16),
            customTextFormField(
              controller: confPassController,
              labelText: 'Confirm Password',
              obscureText: true,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: customElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                text: 'Create Account',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
