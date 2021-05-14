import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_site/project_page.dart';
import 'package:portfolio_site/side_menu.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'corner_decoration.dart';

import 'Globaltheme.dart';

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
                  child: SideMenu(scrollController: _scrollController),
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
        ],
      ),
    ),
  );
}

_createHome(BuildContext context) {
  TextStyle headerStyle = TextStyle(color: Colors.white);
  TextStyle bodyStyle =
      TextStyle(color: GlobalTheme.mutedWhite, fontStyle: FontStyle.italic);
  TextStyle barStyle =
      TextStyle(color: GlobalTheme.mutedWhite, fontWeight: FontWeight.bold);

  return SizedBox(
    width: MediaQuery.of(context).size.width / 2,
    height: MediaQuery.of(context).size.width / 2,
    child: (Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: AutoSizeText.rich(
                TextSpan(
                  text: "Hi, I'm Ricky",
                  style: headerStyle,
                ),
                presetFontSizes: [
                  105,
                  100,
                  95,
                  90,
                  85,
                  80,
                  75,
                  70,
                  65,
                  60,
                  55,
                  50,
                  45,
                  40,
                  35,
                  30,
                  25,
                  20,
                  15
                ],
                maxLines: 1,
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              child: AutoSizeText.rich(
                  TextSpan(children: [
                    TextSpan(text: "｜", style: barStyle),
                    TextSpan(text: "A programmer, I guess", style: bodyStyle)
                  ]),
                  presetFontSizes: [
                    45,
                    42,
                    39,
                    36,
                    33,
                    30,
                    37,
                    24,
                    21,
                    18,
                    15,
                    12,
                    9
                  ],
                  maxLines: 1),
            )
          ],
        ),
      ],
    )),
  );
}

_createAbout(BuildContext context) {
  TextStyle headerStyle = TextStyle(color: Colors.white);
  TextStyle bodyStyle = TextStyle(
      color: GlobalTheme.mutedWhite, fontSize: 32, fontStyle: FontStyle.italic);

  return SizedBox(
    width: MediaQuery.of(context).size.width / 2,
    height: MediaQuery.of(context).size.width / 2,
    child: (Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AutoSizeText.rich(
          TextSpan(
            text: "About Me",
            style: headerStyle,
          ),
          presetFontSizes: [75, 60, 45, 30, 15],
          maxLines: 1,
        ),
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
