import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../providers/login_provider.dart';
import '../widgets/build_text_field.dart';
import '../widgets/mthods_row.dart';
import 'main_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    return Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0, 20, 0),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              top: 25.0,
            ),
            child: Text(
              "Log in to your account",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          SizedBox(height: 30.0),
          build_text_field(
              context: context,
              controller: loginProvider.usernameController,
              hintText: "Username",
              icon: Icons.perm_identity,
              isPassword: false),
          SizedBox(height: 10.0),
          build_text_field(
              context: context,
              controller: loginProvider.passwordController,
              hintText: "Password",
              icon: Icons.lock_outline,
              isPassword: true),
          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(height: 30.0),
          Container(
            height: 50.0,
            child: ElevatedButton(
              child: Text(
                "LOGIN".toUpperCase(),
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w100),
              ),
              onPressed: () => loginProvider.login(context),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Divider(color: Theme.of(context).colorScheme.secondary),
          SizedBox(height: 10.0),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              child: MethodsRow(),
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
