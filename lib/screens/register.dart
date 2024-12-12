import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../providers/register_provider.dart';
import '../widgets/mthods_row.dart';
import 'main_screen.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterProvider>(context);

    return Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0, 20, 0),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 25.0),
            child: Text(
              "Create an account",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          SizedBox(height: 30.0),
          buildTextField(
            context,
            controllerText: registerProvider.setUsername,
            hintText: 'Username',
            icon: Icons.perm_identity,
          ),
          SizedBox(height: 10.0),
          buildTextField(
            context,
            controllerText: registerProvider.setEmail,
            hintText: 'Email',
            icon: Icons.mail_outline,
          ),
          SizedBox(height: 10.0),
          buildTextField(
            context,
            controllerText: registerProvider.setPassword,
            hintText: 'Password',
            icon: Icons.lock_outline,
            obscureText: true,
          ),
          SizedBox(height: 40.0),
          Container(
            height: 50.0,
            child: ElevatedButton(
              child: Text(
                "Register".toUpperCase(),
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w100),
              ),
              onPressed: () {
                registerProvider.register();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MainScreen()),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black45),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Divider(color: Theme.of(context).colorScheme.secondary),
          SizedBox(height: 10.0),
          MethodsRow(),
        ],
      ),
    );
  }

  Widget buildTextField(
    BuildContext context, {
    required Function(String) controllerText,
    required String hintText,
    required IconData icon,
    bool obscureText = false,
  }) {
    return Card(
      elevation: 3.0,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: TextField(
          style: TextStyle(fontSize: 15.0, color: Colors.black),
          obscureText: obscureText,
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
            prefixIcon: Icon(
              icon,
              color: Colors.black,
            ),
            hintStyle: TextStyle(
              fontWeight: FontWeight.w100,
              fontSize: 15.0,
              color: Colors.black,
            ),
          ),
          maxLines: 1,
          onChanged: controllerText,
        ),
      ),
    );
  }

  // Widget buildSocialLoginButtons(BuildContext context) {
  //   return Center(
  //     child: Container(
  //       width: MediaQuery.of(context).size.width / 2,
  //       child: MethodsRow(),
  //     ),
  //   );
  // }
}
