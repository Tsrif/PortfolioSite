import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_site/Sections/about_section.dart';
import 'package:portfolio_site/Sections/contact_section.dart';
import 'package:portfolio_site/Sections/home_section.dart';
import 'package:portfolio_site/Widgets/animated_button.dart';
import 'package:portfolio_site/Sections/project_section.dart';
import 'package:portfolio_site/Widgets/side_menu.dart';
import 'package:portfolio_site/Utility/size_config.dart';
import 'package:portfolio_site/Widgets/top_menu.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'Utility/Globaltheme.dart';

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
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return [
                          _createSection(
                              context, HomeSection(isMobile: isMobile),
                              height: SizeConfig.blockSizeVertical * 100),
                          _createSection(context, AboutSection(),
                              height: SizeConfig.blockSizeVertical * 100),
                          _createSection(
                              context, ProjectSection(isMobile: isMobile),
                              height: isMobile == false
                                  ? SizeConfig.blockSizeVertical * 150
                                  : SizeConfig.blockSizeVertical * 200),
                          _createSection(context, ContactSection(isMobile: isMobile),
                              height: SizeConfig.blockSizeVertical * 110),
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
