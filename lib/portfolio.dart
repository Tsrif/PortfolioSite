import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_site/animated_button.dart';
import 'package:portfolio_site/project_page.dart';
import 'package:portfolio_site/side_menu.dart';
import 'package:portfolio_site/size_config.dart';
import 'package:portfolio_site/top_menu.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'Globaltheme.dart';

SizeConfig sizeConfig = SizeConfig.instance;

class PortfolioSite extends StatefulWidget {
  PortfolioSite({Key key}) : super(key: key);

  @override
  _PortfolioSiteState createState() => _PortfolioSiteState();
}

class _PortfolioSiteState extends State<PortfolioSite> {
  ItemScrollController _scrollController = ItemScrollController();
  bool isMobile = false;
  int tapCount = 0;

  @override
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    if (SizeConfig.screenWidth <= 768) {
      isMobile = true;
    } else {
      isMobile = false;
    }
    return Scaffold(
        primary: true,
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-1.0, 0.0),
              end: Alignment(1.0, 0.0),
              colors: GlobalTheme.primaryGradient,
              stops: [0.0, 1.0],
            ),
          ),
          child: Stack(
            children: [
              AnimatedButton(
                cornerDecoration: false,
                onTap: () {
                  setState(() {
                    tapCount++;
                    GlobalTheme.setRandomTheme(colorTheme: tapCount % 5);
                  });
                },
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      padding: EdgeInsets.only(
                          bottom: SizeConfig.blockSizeVertical * 20, left: 20),
                      child: Column(children: [
                        SizedBox(height: 20),
                        AutoSizeText('Ricky',
                            style: TextStyle(
                                fontSize: 22, color: GlobalTheme.primaryColor)),
                        AutoSizeText('Rivera',
                            style: TextStyle(
                                fontSize: 22,
                                color: GlobalTheme.secondaryColor)),
                        SizedBox(
                            width: 70,
                            child: Divider(
                                thickness: 3, color: GlobalTheme.dividerColor)),
                      ])),
                ),
              ),
              Visibility(
                  visible: !isMobile,
                  child: SideMenu(scrollController: _scrollController)),
              Visibility(
                  visible: isMobile,
                  child: TopMenu(scrollController: _scrollController)),
              Positioned.fill(
                left: isMobile == true ? 0 : 100,
                top: isMobile == true ? 80 : 0,
                child: Align(
                    alignment: Alignment.centerRight,
                    child: ScrollablePositionedList.builder(
                      itemScrollController: _scrollController,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return [
                          _createSection(
                              context, _createHome(context, isMobile),
                              height: SizeConfig.blockSizeVertical * 100),
                          _createSection(context, _createAbout(context),
                              height: SizeConfig.blockSizeVertical * 100),
                          _createSection(
                              context, ProjectPage(isMobile: isMobile),
                              height: isMobile == false
                                  ? SizeConfig.blockSizeVertical * 150
                                  : SizeConfig.blockSizeVertical * 280),
                        ][index];
                      },
                    )),
              ),
            ],
          ),
        ));
  }
}

_createSection(BuildContext context, Widget content, {double height}) {
  return SizedBox(
      height: height,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          //color: GlobalTheme.appBarColor,
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(9.0),
          //   gradient: LinearGradient(
          //     begin: Alignment(-1.0, 0.0),
          //     end: Alignment(1.0, 0.0),
          //     colors: GlobalTheme.darkGradient4,
          //     stops: [0.0, 1.0],
          //   ),
          // ),
          child: Center(child: content),
        ),
      ));
}

// sectionContentBox(BuildContext context) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 15),
//     child: Container(
//       width: MediaQuery.of(context).size.width / 5,
//       height: 400,
//       decoration: ConcaveDecoration(
//           depression: 5,
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//           colors: [Color(0x3e000000), Color(0XFF4D4A50)]),
//       child: Column(
//         //mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SizedBox(height: 10.0),
//           Center(
//             child: AutoSizeText(
//               'Project Name',
//               style: TextStyle(fontSize: 32, color: Color(0XFFE6E3E9)),
//             ),
//           ),
//           SizedBox(height: 10.0),
//           Center(
//             child: Container(
//               width: MediaQuery.of(context).size.width / 6,
//               child: AutoSizeText(
//                 "I don't know. Maybe put like the project description here?",
//                 style: TextStyle(fontSize: 15, color: Color(0XFFE6E3E9)),
//               ),
//             ),
//           ),
//           SizedBox(height: 50),
//         ],
//       ),
//     ),
//   );
// }

_createHome(BuildContext context, bool isMobile) {
  TextStyle headerStyle = TextStyle(
      color: Colors.white,
      fontSize: isMobile == false
          ? SizeConfig.safeBlockHorizontal * 11
          : SizeConfig.safeBlockHorizontal * 13);
  TextStyle headerStyle2 = TextStyle(
      color: GlobalTheme.primaryColor,
      fontSize: isMobile == false
          ? SizeConfig.safeBlockHorizontal * 11
          : SizeConfig.safeBlockHorizontal * 13);
  TextStyle bodyStyle = TextStyle(
      color: GlobalTheme.secondaryColor,
      fontStyle: FontStyle.italic,
      fontSize: isMobile == false
          ? SizeConfig.safeBlockHorizontal * 3.8
          : SizeConfig.safeBlockHorizontal * 5);
  TextStyle animatedText = TextStyle(
      color: GlobalTheme.primaryColor,
      fontStyle: FontStyle.italic,
      fontSize: isMobile == false
          ? SizeConfig.safeBlockHorizontal * 3.8
          : SizeConfig.safeBlockHorizontal * 5);
  TextStyle barStyle = TextStyle(
      color: GlobalTheme.secondaryColor,
      fontWeight: FontWeight.bold,
      fontSize: isMobile == false
          ? SizeConfig.safeBlockHorizontal * 3.8
          : SizeConfig.safeBlockHorizontal * 5);

//This whole thing is confusing and hard to look at
//There's gotta be an easier way to make this happen with not as ugly code
  return SizedBox(
    width: SizeConfig.blockSizeHorizontal * 50,
    //height: SizeConfig.safeBlockVertical * 80,
    child: (Stack(
      alignment: Alignment.center,
      children: [
        if (isMobile == false)
          Row(
            children: [
              AutoSizeText.rich(
                TextSpan(
                  children: [
                    TextSpan(text: "Hi, I'm ", style: headerStyle),
                    TextSpan(text: "Ricky", style: headerStyle2)
                  ],
                ),
                maxLines: 1,
              ),
            ],
          )
        else
          Transform.translate(
            offset: Offset(0, SizeConfig.safeBlockHorizontal * -7),
            child: Row(
              children: [
                Stack(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Transform.translate(
                      offset: Offset(SizeConfig.safeBlockHorizontal * -0.5,
                          SizeConfig.safeBlockHorizontal * -2),
                      child: AutoSizeText.rich(TextSpan(
                        children: [
                          TextSpan(text: "Hi, I'm ", style: headerStyle)
                        ],
                      )),
                    ),
                    Transform.translate(
                      offset: Offset(SizeConfig.safeBlockHorizontal * -0.5,
                          SizeConfig.safeBlockHorizontal * 8),
                      child: AutoSizeText.rich(TextSpan(
                        children: [
                          TextSpan(text: "Ricky", style: headerStyle2)
                        ],
                      )),
                    ),
                  ],
                )
              ],
            ),
          ),
        Transform.translate(
          offset: Offset(
              isMobile == false ? SizeConfig.safeBlockHorizontal * 0.7 : 2,
              isMobile == false
                  ? SizeConfig.safeBlockHorizontal * 7
                  : SizeConfig.safeBlockHorizontal * 9),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText.rich(
                  TextSpan(children: [
                    TextSpan(text: "| ", style: barStyle),
                    TextSpan(text: "A", style: bodyStyle)
                  ]),
                  maxLines: 1),
              SizedBox(width: SizeConfig.blockSizeHorizontal * 0.8),
            ],
          ),
        ),
        Transform.translate(
            offset: Offset(
                isMobile == false
                    ? SizeConfig.safeBlockHorizontal * 4.5
                    : SizeConfig.safeBlockHorizontal * 5.5,
                isMobile == false
                    ? SizeConfig.safeBlockHorizontal * 7
                    : SizeConfig.safeBlockHorizontal * 9),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 10,
                  child: AnimatedTextKit(repeatForever: true, animatedTexts: [
                    RotateAnimatedText(' Programmer',
                        textStyle: animatedText,
                        duration: Duration(milliseconds: 2500)),
                    RotateAnimatedText(' Musician',
                        textStyle: animatedText,
                        duration: Duration(milliseconds: 2500)),
                    RotateAnimatedText(' Cat Lover',
                        textStyle: animatedText,
                        duration: Duration(milliseconds: 2000)),
                  ]),
                )
              ],
            ))
      ],
    )),
  );
}

_createAbout(BuildContext context) {
  TextStyle headerStyle = TextStyle(
      color: Colors.white, fontSize: SizeConfig.safeBlockHorizontal * 11);
  TextStyle headerStyle2 = TextStyle(
      color: GlobalTheme.primaryColor,
      fontSize: SizeConfig.safeBlockHorizontal * 11);
  TextStyle bodyStyle = TextStyle(
      color: GlobalTheme.secondaryColor,
      fontSize: SizeConfig.safeBlockHorizontal * 7,
      fontStyle: FontStyle.italic);

  return SizedBox(
    width: SizeConfig.blockSizeHorizontal * 50,
    height: SizeConfig.blockSizeVertical * 80,
    child: (Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AutoSizeText.rich(
          TextSpan(
            children: [
              TextSpan(text: "About ", style: headerStyle),
              TextSpan(text: "Me", style: headerStyle2)
            ],
            // style: headerStyle,
          ),
          maxLines: 1,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: SizedBox(
              width: SizeConfig.blockSizeHorizontal * 50,
              child: Divider(thickness: 3, color: GlobalTheme.dividerColor)),
        ),
        Expanded(
          child: AutoSizeText.rich(
              TextSpan(children: [
                TextSpan(
                    text:
                        "Hi, I'm Ricky, a full-stack software engineer with a passion for creating experiences through programming. In college, I discovered that I loved working on video games. There are so many skills involved and there's just this certain kind of beauty in all of the complexities of it. This love later extended towards creating UIs and in general trying to create a great experience for users. I've found the best use of my skills and creativity to be in front-end development, but I'm not afraid to take on any lower-level back-end work! I've tackled projects using a myriad of languages including C, Ruby, React, Flutter ( my current favorite language), C#, PHP, and more! I certainly consider myself"),
                TextSpan(
                    text:
                        ' agile ', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(
                    text:
                        '''and a quick learner. 


When I'm not programming, you can find me hanging out with my cat, working on music, or just kicking back and playing some video games. ''')
              ], style: bodyStyle),
              minFontSize: 0,
              stepGranularity: 0.1,
              wrapWords: true),
        ),
      ],
    )),
  );
}
