import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_site/animated_button.dart';
import 'package:portfolio_site/project_page.dart';
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
                            AutoSizeText('Ricky',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: GlobalTheme.primaryPurple)),
                            AutoSizeText('Rivera',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: GlobalTheme.mutedWhite)),
                            SizedBox(width: 70, child: Divider(thickness: 3)),
                          ])),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedButton(
                            child: AutoSizeText('Home',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 28,
                                    color: GlobalTheme.mutedWhite)),
                            onTap: () {
                              _scrollController.scrollTo(
                                  index: 0,
                                  duration: Duration(milliseconds: 1700),
                                  curve: Curves.bounceIn.flipped);
                            },
                          ),
                          SizedBox(height: 10),
                          AnimatedButton(
                            child: AutoSizeText('About',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 28,
                                    color: GlobalTheme.mutedWhite)),
                            onTap: () {
                              _scrollController.scrollTo(
                                  index: 1,
                                  duration: Duration(milliseconds: 1700),
                                  curve: Curves.bounceIn.flipped);
                            },
                          ),
                          SizedBox(height: 10),
                          AnimatedButton(
                            child: AutoSizeText('Projects',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 25,
                                    color: GlobalTheme.mutedWhite)),
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
                        _createSection(context, _createHome(context),
                            customHeight: 2.0),
                        _createSection(
                          context,
                          _createAbout(context),
                        ),
                        _createSection(context, ProjectPage()),
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
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9.0),
            gradient: LinearGradient(
              begin: Alignment(-1.0, 0.0),
              end: Alignment(1.0, 0.0),
              colors: GlobalTheme.darkGradient,
              stops: [0.0, 1.0],
            ),
          ),
          child: Center(child: content),
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
            child: AutoSizeText(
              'Project Name',
              style: TextStyle(fontSize: 32, color: Color(0XFFE6E3E9)),
            ),
          ),
          SizedBox(height: 10.0),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 6,
              child: AutoSizeText(
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

_createHome(BuildContext context) {
  TextStyle headerStyle = TextStyle(color: Colors.white, fontSize: 72);
  TextStyle bodyStyle = TextStyle(
      color: GlobalTheme.mutedWhite, fontSize: 22, fontStyle: FontStyle.italic);
  TextStyle barStyle = TextStyle(
      color: GlobalTheme.mutedWhite, fontSize: 32, fontWeight: FontWeight.bold);
  return Container(
    width: MediaQuery.of(context).size.width / 2,
    height: MediaQuery.of(context).size.width / 2,
    child: (Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AutoSizeText('Hi,', style: headerStyle),
        AutoSizeText("I'm Ricky", style: headerStyle),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(right: 40),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText("｜", style: barStyle),
              AutoSizeText("A programmer,  I guess", style: bodyStyle)
            ],
          ),
        ),
      ],
    )),
  );
}

_createAbout(BuildContext context) {
  TextStyle headerStyle = TextStyle(color: Colors.white, fontSize: 72);
  TextStyle bodyStyle = TextStyle(
      color: GlobalTheme.mutedWhite, fontSize: 32, fontStyle: FontStyle.italic);

  return Container(
    width: MediaQuery.of(context).size.width / 2,
    height: MediaQuery.of(context).size.width / 2,
    child: (Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AutoSizeText.rich(TextSpan(text: 'About Me', style: headerStyle),
            minFontSize: 0, stepGranularity: 0.1, wrapWords: true),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              child: Divider(thickness: 3)),
        ),
        Expanded(
          child: AutoSizeText.rich(
              TextSpan(
                  text:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
                  style: bodyStyle),
              minFontSize: 0,
              stepGranularity: 0.1,
              wrapWords: true),
        ),
      ],
    )),
  );
}
