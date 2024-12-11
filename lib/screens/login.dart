import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../providers/login_provider.dart';
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
          _buildTextField(
            context,
            controller: loginProvider.usernameController,
            hintText: "Username",
            icon: Icons.perm_identity,
          ),
          SizedBox(height: 10.0),
          _buildTextField(
            context,
            controller: loginProvider.passwordController,
            hintText: "Password",
            icon: Icons.lock_outline,
            isPassword: true,
          ),
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
                style: TextStyle(color: Colors.white),
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
              child: Row(
                children: <Widget>[
                  RawMaterialButton(
                    onPressed: () {},
                    fillColor: Colors.blue[800],
                    shape: CircleBorder(),
                    elevation: 4.0,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Icon(
                        FontAwesomeIcons.facebookF,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  RawMaterialButton(
                    onPressed: () {},
                    fillColor: Colors.white,
                    shape: CircleBorder(),
                    elevation: 4.0,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Icon(
                        FontAwesomeIcons.google,
                        color: Colors.blue[800],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context, {
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Card(
      elevation: 3.0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: TextField(
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(color: Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(5.0),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 15.0,
              color: Colors.black,
            ),
            prefixIcon: Icon(
              icon,
              color: Colors.black,
            ),
          ),
          obscureText: isPassword,
          maxLines: 1,
          controller: controller,
        ),
      ),
    );
  }
}
