import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle getFont(double? fontSize, {Color? color}) => GoogleFonts.poppins(
      color: color ?? Colors.black,
      fontSize: fontSize ?? 14,
    );

TextStyle getFontBold(double? fontSize, {Color? color}) => GoogleFonts.poppins(
      color: color ?? Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: fontSize ?? 14,
    );

const Color primaryColor = Color(0xFF76984b);
const Color secondaryColor = Color(0xFF67854a);
const Color backgroundColor = Color(0xFFececee);
