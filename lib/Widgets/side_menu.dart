import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_site/Utility/Globaltheme.dart';
import 'package:portfolio_site/Widgets/animated_button.dart';
import 'package:portfolio_site/Utility/size_config.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'dart:html' as html;

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key key,
    @required ItemScrollController scrollController,
  })  : _scrollController = scrollController,
        super(key: key);

  final ItemScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
            // Container(
            //     padding: EdgeInsets.only(
            //         bottom: SizeConfig.blockSizeVertical * 25),
            //     child: Column(children: [
            //       SizedBox(height: 20),
            //       AutoSizeText('Ricky',
            //           style: TextStyle(
            //               fontSize: 22, color: GlobalTheme.primaryColor)),
            //       AutoSizeText('Rivera',
            //           style: TextStyle(
            //               fontSize: 22, color: GlobalTheme.secondaryColor)),
            //       SizedBox(width: 70, child: Divider(thickness: 3, color: GlobalTheme.dividerColor)),
            //     ])),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedButton(
                  child: AutoSizeText('Home',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 28, color: GlobalTheme.secondaryColor)),
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
                          fontSize: 28, color: GlobalTheme.secondaryColor)),
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
                      wrapWords: false,
                      style: TextStyle(
                          fontSize: 25, color: GlobalTheme.secondaryColor)),
                  onTap: () {
                    _scrollController.scrollTo(
                        index: 2,
                        duration: Duration(milliseconds: 1700),
                        curve: Curves.bounceIn.flipped);
                  },
                ),
                AnimatedButton(
                  child: AutoSizeText('Contact',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 28, color: GlobalTheme.secondaryColor)),
                  onTap: () {
                    _scrollController.scrollTo(
                        index: 3,
                        duration: Duration(milliseconds: 1700),
                        curve: Curves.bounceIn.flipped);
                  },
                ),
                SizedBox(height: SizeConfig.blockSizeVertical * 20),
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AnimatedButton(
                        child: SizedBox(
                            width: 40,
                            height: 40,
                            child: Image.asset(
                              '/image/Linkedin.png',
                              color: GlobalTheme.secondaryColor,
                            )),
                        onTap: () {
                          html.window.open(
                              'https://www.linkedin.com/in/ricky-rivera-0403b4163/',
                              'new tab');
                        },
                      ),
                      AnimatedButton(
                        child: SizedBox(
                            width: 40,
                            height: 40,
                            child: Image.asset('/image/GitHub.png',
                                color: GlobalTheme.secondaryColor)),
                        onTap: () {
                          html.window
                              .open('https://github.com/Tsrif/', 'new tab');
                        },
                      ),
                    ])
              ],
            )
          ],
        ),
      ),
    );
  }
}
