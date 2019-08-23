import 'package:flash_chat/components/ButtonRounded.dart';
import 'package:flash_chat/components/InputRounded.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            InputRounded(
              hint: 'Enter your email.',
            ),
            SizedBox(
              height: 8.0,
            ),
            InputRounded(
              hint: 'Enter your password.',
            ),
            SizedBox(
              height: 24.0,
            ),
            ButtonRounded(
                text: 'Log In',
                color: Colors.lightBlueAccent,
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
