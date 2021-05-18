import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_site/project_page.dart';
import 'package:portfolio_site/side_menu.dart';
import 'package:portfolio_site/size_config.dart';
import 'package:portfolio_site/top_menu.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'Globaltheme.dart';

SizeConfig sizeConfig = SizeConfig.instance;

class PortfolioSite extends StatefulWidget {
  PortfolioSite({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PortfolioSiteState createState() => _PortfolioSiteState();
}

class _PortfolioSiteState extends State<PortfolioSite> {
  ItemScrollController _scrollController = ItemScrollController();
  bool isMobile = false;

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
        backgroundColor: GlobalTheme.primaryColor,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                  padding: EdgeInsets.only(
                      bottom: SizeConfig.blockSizeVertical * 20, left: 20),
                  child: Column(children: [
                    SizedBox(height: 20),
                    AutoSizeText('Ricky',
                        style: TextStyle(
                            fontSize: 22, color: GlobalTheme.primaryPurple)),
                    AutoSizeText('Rivera',
                        style: TextStyle(
                            fontSize: 22, color: GlobalTheme.mutedWhite)),
                    SizedBox(width: 70, child: Divider(thickness: 3)),
                  ])),
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
                        _createSection(context, _createHome(context)),
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

_createSection(BuildContext context, Widget content) {
  return SizedBox(
      height: SizeConfig.blockSizeVertical * 100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9.0),
            gradient: LinearGradient(
              begin: Alignment(-1.0, 0.0),
              end: Alignment(1.0, 0.0),
              colors: GlobalTheme.darkGradient2,
              stops: [0.0, 1.0],
            ),
          ),
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

_createHome(BuildContext context) {
  TextStyle headerStyle = TextStyle(
      color: Colors.white, fontSize: SizeConfig.safeBlockHorizontal * 11);
  TextStyle headerStyle2 = TextStyle(
      color: GlobalTheme.primaryPurple,
      fontSize: SizeConfig.safeBlockHorizontal * 11);
  TextStyle bodyStyle = TextStyle(
      color: GlobalTheme.mutedWhite,
      fontStyle: FontStyle.italic,
      fontSize: SizeConfig.safeBlockHorizontal * 3.8);
  TextStyle animatedText = TextStyle(
      color: GlobalTheme.primaryPurple,
      fontStyle: FontStyle.italic,
      fontSize: SizeConfig.safeBlockHorizontal * 3.8);
  TextStyle barStyle = TextStyle(
      color: GlobalTheme.mutedWhite,
      fontWeight: FontWeight.bold,
      fontSize: SizeConfig.safeBlockHorizontal * 3.8);

//This whole thing is confusing and hard to look at
//There's gotta be an easier way to make this happen with not as ugly code
  return SizedBox(
    width: SizeConfig.blockSizeHorizontal * 50,
    height: SizeConfig.safeBlockVertical * 30,
    child: (Stack(
      alignment: Alignment.center,
      children: [
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
        ),
        Transform.translate(
          offset: Offset(SizeConfig.safeBlockHorizontal * 0.3,
              SizeConfig.safeBlockHorizontal * 7),
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
            offset: Offset(SizeConfig.safeBlockHorizontal * 4.5,
                SizeConfig.safeBlockHorizontal * 7),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 10,
                  child: AnimatedTextKit(repeatForever: true, animatedTexts: [
                    RotateAnimatedText('Programmer', textStyle: animatedText),
                    RotateAnimatedText('Something else',
                        textStyle: animatedText),
                    RotateAnimatedText('uhh', textStyle: animatedText),
                    RotateAnimatedText('Just gimme a second okay?',
                        textStyle: animatedText),
                    RotateAnimatedText(
                      '...',
                      textStyle: animatedText,
                    ),
                    RotateAnimatedText('Oh I got it', textStyle: animatedText),
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
      color: GlobalTheme.primaryPurple,
      fontSize: SizeConfig.safeBlockHorizontal * 11);
  TextStyle bodyStyle = TextStyle(
      color: GlobalTheme.mutedWhite,
      fontSize: SizeConfig.safeBlockHorizontal * 7,
      fontStyle: FontStyle.italic);

  return SizedBox(
    width: SizeConfig.blockSizeHorizontal * 50,
    height: SizeConfig.blockSizeVertical * 50,
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
