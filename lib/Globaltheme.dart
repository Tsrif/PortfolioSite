import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

    textTheme: GoogleFonts.cabinCondensedTextTheme(),
  );

  //static Color primaryColor = Color(0XFF171618);
  static Color primaryColor = Color(0XFF7C32CA);
  static Color dividerColor = Color(0XFF323134);
  static Color primaryDarkPurple = Color(0xFF170e13);
  static Color lightGray = Color(0XFF4C4C51);
  static Color appBarColor = Color(0XFF2D2D31);
  static Color primaryBlue = Color(0XFF6462FD);
  static Color primaryGreen = Color(0XFF5BD9B5);
  static Color primaryYellow = Color(0XFFF2BB16);
  static Color primaryRed = Color(0XFFF25749);
  static Color primaryPurple = Color(0XFF7C32CA);
  static Color secondaryColor = Color(0XFFB6B6CA);
  static List<Color> darkGradient = [Color(0xFF2E2F3C), Color(0xFF38384A)];
  static List<Color> darkGradient2 = [
    Color(0xFF170e13).withOpacity(0.2),
    Color(0xFF7a7adb).withOpacity(0.2)
  ];
  static List<Color> darkGradient3 = [
    Color(0xFFad1deb).withOpacity(0.2),
    Color(0xFF6e72fc).withOpacity(0.2)
  ];
  static List<Color> primaryGradient = [Color(0xFF161418), Color(0xFF2C2D40)];

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

  static void setRandomTheme({int colorTheme}) {
    var rng = new Random();
    int randomNumber;
    if (colorTheme == null) {
      randomNumber = rng.nextInt(5);
    } else {
      randomNumber = colorTheme;
    }
    switch (randomNumber) {
      case 0:
        setPurpleTheme();
        break;
      case 1:
        setBlueTheme();
        break;
      case 2:
        setRedTheme();
        break;
      case 3:
        setPinkTheme();
        break;
      case 4:
        setOrangeTheme();
        break;
      default:
    }
  }

  static void setPurpleTheme() {
    primaryColor = primaryPurple;
    secondaryColor = Color(0XFFB6B6CA);
    dividerColor = Color(0XFF323134);
    primaryGradient = [Color(0xFF161418), Color(0xFF2C2D40)];
  }

  static void setBlueTheme() {
    primaryColor = primaryBlue;
    secondaryColor = Color(0XFFB6B6CA);
    dividerColor = Color(0XFF323134);
    primaryGradient = [Color(0xFF161418), const Color(0XFF335c81)];
  }

  static void setRedTheme() {
    primaryColor = Colors.red; 
    secondaryColor = Color(0XFFB6B6CA);
    dividerColor = Color(0XFF323134);
    primaryGradient = [Color(0xFF161418), const Color(0XFFc74150)];
  }

  static void setPinkTheme() {
    primaryColor = Color(0XFFfe7bb0);
    secondaryColor = Color(0XFF707084);
    dividerColor = Colors.black.withOpacity(0.3);
    primaryGradient = [Color(0xFF7ee8fa), const Color(0XFFeec0c6)];
  }

  static void setOrangeTheme() {
    //EE7B30
    primaryColor = Color(0xFFEE7B30);
    secondaryColor = Color(0XFFB6B6CA);
    dividerColor = Color(0XFF323134);
    primaryGradient = [Color(0xFF161418), Color(0xFF2b2e59)];
  }
}
