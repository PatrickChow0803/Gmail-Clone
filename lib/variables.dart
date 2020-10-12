import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// curly braces make them optional
TextStyle myStyleMontserrat({double size, Color color, FontWeight fw = FontWeight.normal}) {
  return GoogleFonts.montserrat(fontSize: size, fontWeight: fw, color: color);
}
