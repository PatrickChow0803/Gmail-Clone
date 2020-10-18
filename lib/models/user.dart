import 'package:gmail_clone/variables.dart';

class User {
  void storeuser(email, password, profilepic) {
    userCollection.doc(email).set({
      'email': email,
      'password': password,
      'profilepic': profilepic,
    });
  }
}
