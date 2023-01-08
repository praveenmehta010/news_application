import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final FontWeight weight;
  final double size;
  final Color fontColor;
  
  const CustomText({super.key,
  required this.text,required this.size, required this.fontColor, required this.weight,});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.roboto(color: fontColor, fontSize: size, fontWeight: weight),);
  }
}