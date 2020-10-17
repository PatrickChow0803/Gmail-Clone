import 'dart:io';

import 'package:flutter/material.dart';

import '../variables.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  File imagePath;

  pickImageDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: [
              SimpleDialogOption(
                child: Text(
                  'From Gallery',
                  style: myStyleMontserrat(size: 20.0, color: Colors.lightBlue),
                ),
                onPressed: pickImage,
              ),
              SimpleDialogOption(
                child: Text(
                  'From Camera',
                  style: myStyleMontserrat(size: 20.0, color: Colors.lightBlue),
                ),
                onPressed: pickImage,
              ),
              SimpleDialogOption(
                child: Text(
                  'Cancel',
                  style: myStyleMontserrat(size: 20.0, color: Colors.lightBlue),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                    'Create Account',
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
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          hintText: "Repeat Password",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.lightBlue,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () => pickImageDialog(),
                        ),
                      ),
                      Text(
                        "Choose Profile Image",
                        style: myStyleMontserrat(size: 20.0, color: Colors.black),
                      ),
                    ],
                  ),
                  RaisedButton(
                    onPressed: () {},
                    color: Colors.lightBlueAccent,
                    child: Text(
                      'Register',
                      style: myStyleMontserrat(size: 20.0),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
