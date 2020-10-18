import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// curly braces make them optional
TextStyle myStyleMontserrat({double size, Color color, FontWeight fw = FontWeight.normal}) {
  return GoogleFonts.montserrat(fontSize: size, fontWeight: fw, color: color);
}

// the strings at the end are the folder names that I'm making myself
CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

StorageReference profilePics = FirebaseStorage.instance.ref().child('profilepic');
