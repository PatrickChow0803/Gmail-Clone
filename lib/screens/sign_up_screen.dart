import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gmail_clone/models/user.dart';
import 'package:image_picker/image_picker.dart';
import '../models/user.dart' as myUser;

import '../variables.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  File imagePath;

  // This key is used to show a snackbar within the registerUser method.
  // GlobalKey means being able to access it anywhere
  var scaffoldKey = GlobalKey<ScaffoldState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  pickImage(ImageSource imageSource) async {
    final image = await ImagePicker().getImage(
      source: imageSource,
      maxHeight: 800,
      maxWidth: 670,
    );
    setState(() {
      imagePath = File(image.path);
    });
    Navigator.of(context).pop();
  }

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
                onPressed: () => pickImage(ImageSource.gallery),
              ),
              SimpleDialogOption(
                child: Text(
                  'From Camera',
                  style: myStyleMontserrat(size: 20.0, color: Colors.lightBlue),
                ),
                onPressed: () => pickImage(ImageSource.camera),
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

  uploadImage() async {
    // store image into the storage
    StorageUploadTask storageUploadTask =
        profilePics.child(emailController.text).putFile(imagePath);

    // complete storage
    StorageTaskSnapshot storageTaskSnapshot = await storageUploadTask.onComplete;

    // download pic
    String downloadedPic = await storageTaskSnapshot.ref.getDownloadURL();

    return downloadedPic;
  }

  registerUser() async {
    try {
      String downloadpic = imagePath == null
          ? 'https://theimag.org/wp-content/uploads/2015/01/user-icon-png-person-user-profile-icon-20.png'
          : await uploadImage();
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((signedUser) {
        myUser.User().storeuser(emailController.text, passwordController.text, downloadpic);
      });
    } catch (e) {
      print(e);
      SnackBar snackBar = SnackBar(content: Text(e.toString()));
      scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
                      controller: emailController,
                      decoration: InputDecoration(
                          filled: true,
                          hintText: "Email",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      controller: passwordController,
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
                        child: imagePath == null
                            ? IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () => pickImageDialog(),
                              )
                            : Image(
                                image: FileImage(imagePath),
                              ),
                      ),
                      InkWell(
                        onTap: pickImageDialog,
                        child: Text(
                          "Choose Profile Image",
                          style: myStyleMontserrat(size: 20.0, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  RaisedButton(
                    onPressed: () => registerUser(),
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
