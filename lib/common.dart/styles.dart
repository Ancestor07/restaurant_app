import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;

const Color primaryColor = Color(0xff1d3557);
const Color primaryMediumColor = Color(0xff457b9d);
const Color primaryLightColor = Color(0xffa8dadc);
const Color secondaryColor = Color(0xFFFD5523);
const Color whiteColor = Color(0xffa8dadc);

final TextTheme restaurantTextTheme = TextTheme(
  headline1: GoogleFonts.mukta(
      fontSize: 82, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.mukta(
      fontSize: 51, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: GoogleFonts.mukta(fontSize: 41, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.mukta(
      fontSize: 29, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headline5: GoogleFonts.mukta(fontSize: 21, fontWeight: FontWeight.w400),
  headline6: GoogleFonts.mukta(
      fontSize: 17, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1: GoogleFonts.mukta(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.mukta(
      fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.lato(
      fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.lato(
      fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.lato(
      fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.lato(
      fontSize: 11, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.lato(
      fontSize: 9, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);
