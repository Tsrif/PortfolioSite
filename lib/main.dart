import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_site/portfolio.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'Widgets/splash.dart';

import 'Utility/Globaltheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    //GlobalTheme.setRandomTheme();
    GlobalTheme.setPurpleTheme();
    //cache all the gifs on inital load
    //precacheImage(new AssetImage('gif/smallGlitchyHead.gif'), context);
    precacheImage(new AssetImage('gif/HolidayHellper.gif'), context);
    precacheImage(new AssetImage('gif/BurgieFlip.gif'), context);
    precacheImage(new AssetImage('gif/RoleUp-Smaller.gif'), context);

    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
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
                image: Image.asset('gif/smallGlitchyHead.gif'),
                backgroundColor: Colors.black,
                photoSize: 300.0),
          );
          ;
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator();
      },
    );
  }
}
