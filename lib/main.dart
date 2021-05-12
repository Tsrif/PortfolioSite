import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_site/animated_button.dart';
import 'package:portfolio_site/project_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'corner_decoration.dart';
import 'splash.dart';

import 'Globaltheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ricky's Portfolio",
      theme: GlobalTheme.darkTheme,
      home: Center(
        child: Splash(
            miliseconds: 700,
            navigateAfterSeconds: PortfolioSite(title: 'Demo'),
            image: Image.asset('gif/glitchyhead.gif'),
            backgroundColor: Colors.black,
            photoSize: 300.0),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: SafeArea(
//           // put DevTools very high in the widget hierarchy
//           child: AnimationDeveloperTools(
//             child: Center(
//               child: MyAnimatedWidget(),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class PortfolioSite extends StatefulWidget {
  PortfolioSite({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PortfolioSiteState createState() => _PortfolioSiteState();
}

class _PortfolioSiteState extends State<PortfolioSite> {
  ItemScrollController _scrollController = ItemScrollController();

  @override
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        primary: true,
        backgroundColor: GlobalTheme.primaryColor,
        body: Stack(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: 115,
                  color: GlobalTheme.primaryColor,
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height / 4),
                          child: Column(children: [
                            SizedBox(height: 20),
                            Text('Ricky',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: GlobalTheme.primaryBlue)),
                            Text('Rivera',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: GlobalTheme.primaryBlue)),
                            SizedBox(width: 70, child: Divider(thickness: 3)),
                          ])),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedButton(
                            child: Text('Home',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 28, color: Colors.white)),
                            onTap: () {
                              _scrollController.scrollTo(
                                  index: 0,
                                  duration: Duration(milliseconds: 1700),
                                  curve: Curves.bounceIn.flipped);
                            },
                          ),
                          SizedBox(height: 10),
                          AnimatedButton(
                            child: Text('About',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 28, color: Colors.white)),
                            onTap: () {
                              _scrollController.scrollTo(
                                  index: 1,
                                  duration: Duration(milliseconds: 1700),
                                  curve: Curves.bounceIn.flipped);
                            },
                          ),
                          SizedBox(height: 10),
                          AnimatedButton(
                            child: Text('Projects',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white)),
                            onTap: () {
                              _scrollController.scrollTo(
                                  index: 2,
                                  duration: Duration(milliseconds: 1700),
                                  curve: Curves.bounceIn.flipped);
                            },
                          ),
                        ],
                      )
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
                        _createSection(context, _createHome(),
                            customHeight: 2.0),
                        _createSection(
                            context,
                            Text('About Section',
                                style: TextStyle(color: Colors.white))),
                        _createSection(
                            context,
                            //Yeah yeah yeah, I could technically do this with a grid view, but then everything isn't sized correctly
                            //And yeah I could use the staggered view package, but this is honestly easier to just do manually
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  ProjectWidget(
                                      randomPictureHeight: 500,
                                      randomPictureWidth: 500),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  ProjectWidget(
                                      randomPictureHeight: 400,
                                      randomPictureWidth: 600),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  ProjectWidget(
                                      randomPictureHeight: 800,
                                      randomPictureWidth: 600)
                                ],
                              ),
                            )),
                      ][index];
                    },
                  )),
            ),
          ],
        ));
  }
}

_createSection(BuildContext context, Widget content,
    {double customHeight = 2.0}) {
  return SizedBox(
      height: MediaQuery.of(context).size.width / customHeight,
      width: MediaQuery.of(context).size.width / 1.1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            //side: BorderSide(color: Colors.transparent, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: content),
          color: GlobalTheme.appBarColor,
        ),
      ));
}

sectionContentBox(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: Container(
      width: MediaQuery.of(context).size.width / 5,
      height: 400,
      decoration: ConcaveDecoration(
          depression: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          colors: [Color(0x3e000000), Color(0XFF4D4A50)]),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10.0),
          Center(
            child: Text(
              'Project Name',
              style: TextStyle(fontSize: 32, color: Color(0XFFE6E3E9)),
            ),
          ),
          SizedBox(height: 10.0),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 6,
              child: Text(
                "I don't know. Maybe put like the project description here?",
                style: TextStyle(fontSize: 15, color: Color(0XFFE6E3E9)),
              ),
            ),
          ),
          SizedBox(height: 50),
          // CarouselSlider(
          //     items: [
          //       Image.network('https://picsum.photos/250?image=9'),
          //       Image.network('https://picsum.photos/250?image=10'),
          //       Image.network('https://picsum.photos/250?image=11'),
          //       Image.network('https://picsum.photos/250?image=12')
          //     ],
          //     options: CarouselOptions(
          //       height: 200,
          //       aspectRatio: 16 / 9,
          //       viewportFraction: 0.8,
          //       initialPage: 0,
          //       enableInfiniteScroll: true,
          //       reverse: false,
          //       autoPlay: false,
          //       autoPlayInterval: Duration(seconds: 3),
          //       autoPlayAnimationDuration: Duration(milliseconds: 800),
          //       autoPlayCurve: Curves.fastOutSlowIn,
          //       enlargeCenterPage: true,
          //       //onPageChanged: callbackFunction,
          //       scrollDirection: Axis.horizontal,
          //     ))
        ],
      ),
    ),
  );
}

_createHome() {
  TextStyle headerStyle = TextStyle(color: Colors.white, fontSize: 72);
  TextStyle bodyStyle =
      TextStyle(color: Colors.white, fontSize: 22, fontStyle: FontStyle.italic);
  TextStyle barStyle =
      TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold);
  return (Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('Hi,', style: headerStyle),
      Text("I'm Ricky", style: headerStyle),
      SizedBox(height: 5),
      Padding(
        padding: const EdgeInsets.only(right: 40),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("｜", style: barStyle),
            Text("A programmer,  I guess", style: bodyStyle)
          ],
        ),
      ),
    ],
  ));
}
