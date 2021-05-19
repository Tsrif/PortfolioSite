import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_site/Globaltheme.dart';
import 'package:portfolio_site/animated_button.dart';
import 'package:portfolio_site/size_config.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

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
            //               fontSize: 22, color: GlobalTheme.primaryPurple)),
            //       AutoSizeText('Rivera',
            //           style: TextStyle(
            //               fontSize: 22, color: GlobalTheme.mutedWhite)),
            //       SizedBox(width: 70, child: Divider(thickness: 3)),
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
                      style:
                          TextStyle(fontSize: 28, color: GlobalTheme.mutedWhite)),
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
                      style:
                          TextStyle(fontSize: 28, color: GlobalTheme.mutedWhite)),
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
                      style:
                          TextStyle(fontSize: 25, color: GlobalTheme.mutedWhite)),
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
      ),
    );
  }
}
