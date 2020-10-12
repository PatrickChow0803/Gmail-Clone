import 'package:flutter/material.dart';
import 'package:gmail_clone/screens/mail_screen.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  bool _isSignedIn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isSignedIn ? MailScreen() : LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
