import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//COLORS
const colorWhite = Colors.white;
const colorBlack = Colors.black;
const colorGrey = Colors.grey;
const colorTransparent = Colors.transparent;
const colorScaffoldBackground = colorWhite;
const colorPrimary = colorYellow;
const colorFont = colorBlack;
const colorYellow = Color(0xfff39300);


//TEXT STYLES
final fontStyleLight =
    GoogleFonts.roboto(fontWeight: FontWeight.bold, color: colorFont);

final textStyleTitle = GoogleFonts.roboto(
    fontWeight: FontWeight.w400, color: colorFont, fontSize: 14);

final textStyleSubTitle = GoogleFonts.roboto(
    fontWeight: FontWeight.w400, color: colorFont, fontSize: 12);


TextStyle? getHeadlineSmall(context) {
  return Theme.of(context).textTheme.headlineSmall;
}

TextStyle? getHeadlineMedium(context) {
  return Theme.of(context).textTheme.headlineMedium;
}

TextStyle? getHeadlineLarge(context) {
  return Theme.of(context).textTheme.headlineLarge;
}

const primarySwatchLight = MaterialColor(0xFFFFFFFF, {
  50: Color(0xFFFFFFFF),
  100: Color(0xFFFFFFFF),
  200: Color(0xFFFFFFFF),
  300: Color(0xFFFFFFFF),
  400: Color(0xFFFFFFFF),
  500: Color(0xFFFFFFFF),
  600: Color(0xFFFFFFFF),
  700: Color(0xFFFFFFFF),
  800: Color(0xFFFFFFFF),
  900: Color(0xFFFFFFFF),
});
