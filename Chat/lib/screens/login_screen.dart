import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/ButtonRounded.dart';
import 'package:flash_chat/components/InputRounded.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = 'weslley39@gmail.com';
  String password = '123456';
  bool isLoading = false;
  final _authService = FirebaseAuth.instance;

  void doLogin() async {
    try {
      setState(() {
        isLoading = true;
      });
      var user = await _authService.signInWithEmailAndPassword(
          email: this.email, password: this.password);
      if (user != null) {
        Navigator.pushNamed(context, ChatScreen.id);
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: this.isLoading,
      child: Scaffold(
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
                type: TextInputType.emailAddress,
                hint: 'Enter your email.',
                onChange: (value) {
                  this.email = value;
                },
              ),
              SizedBox(
                height: 8.0,
              ),
              InputRounded(
                isObscure: true,
                hint: 'Enter your password.',
                onChange: (value) {
                  this.password = value;
                },
              ),
              SizedBox(
                height: 24.0,
              ),
              ButtonRounded(
                  text: 'Log In',
                  color: Colors.lightBlueAccent,
                  onPressed: () {
                    this.doLogin();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
