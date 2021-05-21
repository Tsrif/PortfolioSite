import 'package:flutter/material.dart';
import 'package:portfolio_site/portfolio.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'splash.dart';

import 'Globaltheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //cache gif
    precacheImage(new AssetImage('gif/glitchyhead.gif'), context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: GlobalTheme.darkTheme,
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget),
        defaultScale: true,
        minWidth: 480,
        defaultName: DESKTOP,
        breakpoints: [
          ResponsiveBreakpoint.autoScale(480, name: MOBILE),
          ResponsiveBreakpoint.resize(600, name: MOBILE),
          ResponsiveBreakpoint.resize(850, name: TABLET),
          ResponsiveBreakpoint.resize(1080, name: DESKTOP),
        ],
      ),
      home: Splash(
          miliseconds: 700,
          navigateAfterSeconds: PortfolioSite(),
          image: Image.asset('gif/glitchyhead.gif'),
          backgroundColor: Colors.black,
          photoSize: 300.0),
    );
  }
}
