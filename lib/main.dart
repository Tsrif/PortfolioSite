import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:splashscreen/splashscreen.dart';

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
                  color: GlobalTheme.appBarColor,
                  child: Column(
                    children: [
                      Container(
                          width: 200,
                          height: 200,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: GlobalTheme.primaryBlue, // background
                                onPrimary: Color(0xff7289da), // foreground
                              ),
                              onPressed: () {
                                _scrollController.scrollTo(
                                    index: 0,
                                    duration: Duration(milliseconds: 700),
                                    curve: Curves.easeInCirc);
                              },
                              child: Text('Home',
                                  style: TextStyle(color: Colors.black)))),
                      Container(
                          width: 200,
                          height: 200,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: GlobalTheme.primaryGreen, // background
                                onPrimary: Color(0xff7289da), // foreground
                              ),
                              onPressed: () {
                                _scrollController.scrollTo(
                                    index: 1,
                                    duration: Duration(milliseconds: 700),
                                    curve: Curves.easeInCirc);
                              },
                              child: Text('About',
                                  style: TextStyle(color: Colors.black)))),
                      Container(
                          width: 200,
                          height: 200,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: GlobalTheme.primaryRed, // background
                                onPrimary: Color(0xff7289da), // foreground
                              ),
                              onPressed: () {
                                _scrollController.scrollTo(
                                    index: 2,
                                    duration: Duration(milliseconds: 700),
                                    curve: Curves.easeInCirc);
                              },
                              child: Text('Projects',
                                  style: TextStyle(color: Colors.black))))
                    ],
                  ),
                )),
            Positioned.fill(
              left: 200,
              child: Align(
                  alignment: Alignment.centerRight,
                  child: ScrollablePositionedList.builder(
                    itemScrollController: _scrollController,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return [
                        SizedBox(
                            height: 1200.0,
                            width: MediaQuery.of(context).size.width / 1.1,
                            child: new Card(
                                child: Text('Home Section'),
                                color: GlobalTheme.appBarColor)),
                        SizedBox(
                            height: 1200.0,
                            width: MediaQuery.of(context).size.width / 1.1,
                            child: new Card(
                                child: Text('About Section'),
                                color: GlobalTheme.appBarColor)),
                        SizedBox(
                            height: 1200.0,
                            width: MediaQuery.of(context).size.width / 1.1,
                            child: new Card(
                                child: Text('Projects Section'),
                                color: GlobalTheme.appBarColor)),
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
