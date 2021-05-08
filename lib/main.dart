import 'package:flutter/material.dart';
import 'package:portfolio_site/animated_button.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:portfolio_site/custom_cursor.dart';

import 'Globaltheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ricky's Portfolio",
      theme: GlobalTheme.darkTheme,
      home: Center(
        child: SplashScreen(
            seconds: 1,
            navigateAfterSeconds: MyHomePage(title: 'Demo'),
            // title: Text('Ricky Rivera',
            //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0)),
            image: Image.asset('gif/glitchyhead.gif'),
            backgroundColor: Colors.black,
            //styleTextUnderTheLoader:TextStyle(fontWeight: FontWeight.bold, fontSize: 100.0),
            photoSize: 300.0,
            useLoader: false),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ItemScrollController _scrollController = ItemScrollController();

  @override
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        primary: true,
        backgroundColor: GlobalTheme.primaryColor,
        appBar: AppBar(
          title: const Text('Home'),
          //leading: Image.asset('image/mehead.png'),
          backgroundColor: GlobalTheme.appBarColor,
        ),
        body: Stack(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: 100,
                  color: GlobalTheme.primaryColor,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text('Ricky',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Rivera',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Divider(thickness: 3),
                      _createNavButton(_scrollController,
                          GlobalTheme.primaryBlue, 'Home', 0),
                      _createNavButton(_scrollController,
                          GlobalTheme.primaryGreen, 'About', 1),
                      _createNavButton(_scrollController,
                          GlobalTheme.primaryRed, 'Projects', 2)
                    ],
                  ),
                )),
            Positioned.fill(
              left: 96,
              child: Align(
                  alignment: Alignment.centerRight,
                  child: ScrollablePositionedList.builder(
                    itemScrollController: _scrollController,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return [
                        _createCard(context, 'Home Section'),
                        _createCard(context, 'About Section'),
                        _createCard(context, 'Projects Section'),
                      ][index];
                    },
                  )),
            ),
          ],
        )
        // bottomNavigationBar: ElevatedButton(
        //   onPressed: () => Scrollable.ensureVisible(projectsKey.currentContext),
        //   child: Text("Scroll to data"),
        // ),
        );
  }
}

_createCard(BuildContext context, String text) {
  return SizedBox(
      height: MediaQuery.of(context).size.width / 2.1,
      width: MediaQuery.of(context).size.width / 1.1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
            shape: RoundedRectangleBorder(
              //side: BorderSide(color: Colors.transparent, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Text(text)),
            color: GlobalTheme.appBarColor),
      ));
}

_createNavButton(ItemScrollController _scrollController, Color color,
    String text, int scrollIndex) {
  // return AnimatedButton(
  //   width: 120,
  //   height: 40,
  //   text: 'Carrot',
  //   animationColor: ButtonColors.carrot,
  // );
  return CustomCursor(
    cursorStyle: CustomCursor.text,
    child: TextButton(
      child: Text(text, 
      // style: TextStyle(color: color)
      ),
      onPressed: () {
        _scrollController.scrollTo(
            index: scrollIndex,
            duration: Duration(seconds: 1),
            curve: Curves.bounceIn.flipped);
      },
    ),
  );
}
