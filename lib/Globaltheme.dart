import 'dart:ui';

import 'package:flutter/material.dart';

Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

MaterialColor colorCustom = MaterialColor(0xFF6462FD, color);
//Old custom color
Color idea = Color(0xFF5f85db);

class GlobalTheme {
  static ThemeData lightTheme = new ThemeData(
      // Define the default brightness and colors.
      brightness: Brightness.light,
      primarySwatch: Colors.blueGrey,
      accentColor: Colors.cyan[600],
      buttonColor: Color(0xff4FB286),

      // Define the default font family.
      fontFamily: 'Roboto',

      // Define the default TextTheme. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: TextTheme(
        headline5: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      ));

  static ThemeData darkTheme = new ThemeData(
      // Define the default brightness and colors.
      brightness: Brightness.dark,
      primarySwatch: colorCustom,
      primaryColor: Color(0XFF32333D),
      //Think of this as the secondary color - 0XFF3F404A
      primaryColorDark: Color(0XFF171618),
      //primaryColor: Color(0xff303841),
      //primaryColor: Color(0xff26282b),
      //accentColor: Color(0xff7B7EFF),
      //buttonColor: Color(0xffeb4d55),
      //accentColor: Color(0xFF0F5B55),
      //buttonColor: Color(0xff2AB77E),

      // Define the default font family.
      fontFamily: 'RobotoCondensed',

      // Define the default TextTheme. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: TextTheme(
        headline5: TextStyle(
          fontSize: 72.0,
          fontWeight: FontWeight.bold,
        ),
        headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        bodyText2: TextStyle(
          fontSize: 14.0,
          fontFamily: 'RobotoCondensed',
        ),
        bodyText1: TextStyle(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 20),
        headline4: TextStyle(
            color: Color(0xff000000).withOpacity(0.34),
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 40),
      ));

  static Color primaryColor = Color(0XFF171618);
  static Color lightGray = Color(0XFF4C4C51);
  static Color appBarColor = Color(0XFF2D2D31);
  static Color primaryBlue = Color(0XFF6462FD);
  static Color primaryGreen = Color(0XFF5BD9B5);
  static Color primaryYellow = Color(0XFFF2BB16);
  static Color primaryRed = Color(0XFFF25749);
  static List<List<Color>> gradients = [
    [const Color(0xffB15DFF), const Color(0xff72DEFF)],
    [const Color(0xff36d6aa), const Color(0xff2ec9f2)],
    [const Color(0xff2b5876), const Color(0xff4e4376)],
    [const Color(0xffe65c00), const Color(0xffF9D423)],
    [const Color(0xffcc2b5e), const Color(0xff753a88)],
    [const Color(0xffec008c), const Color(0xfffc6767)],
    [const Color(0xff9796f0), const Color(0xfffbc7d4)],
    [const Color(0xffdd3e54), const Color(0xff6be585)],
    [const Color(0xff333333), const Color(0xffdd1818)],
    [const Color(0xffFC466B), const Color(0xff3F5EFB)],
  ];
}