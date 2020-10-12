import 'package:flutter/material.dart';
import 'package:gmail_clone/screens/mail_screen.dart';
import 'package:gmail_clone/screens/sign_up_screen.dart';
import 'package:gmail_clone/variables.dart';

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
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Card(
            elevation: 10.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Email',
                  style: myStyleMontserrat(size: 25.0, color: Colors.purple),
                ),
                SizedBox(height: 5.0),
                Text(
                  'Login',
                  style: myStyleMontserrat(size: 18.0, color: Colors.black),
                ),
                SizedBox(height: 10.0),
                Text("Continue to email",
                    style: myStyleMontserrat(size: 18.0, color: Colors.black)),
                SizedBox(height: 20.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                        filled: true,
                        hintText: "Username",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                        filled: true,
                        hintText: "Password",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
                  ),
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                      onPressed: () => Navigator.push(
                          context, MaterialPageRoute(builder: (context) => SignUpScreen())),
                      color: Colors.lightBlue[200],
                      child: Text(
                        "Create Account",
                        style: myStyleMontserrat(size: 20.0),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      color: Colors.lightBlue[200],
                      child: Text(
                        "Login",
                        style: myStyleMontserrat(size: 20.0),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
