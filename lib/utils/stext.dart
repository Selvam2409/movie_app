import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Stext extends StatelessWidget {
  const Stext({
    Key? key,
    required this.text,
    required this.size,
  }) : super(key: key);
  final String text;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.breeSerif(fontSize: size));
  }
}
