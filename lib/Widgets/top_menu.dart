import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_site/Utility/Globaltheme.dart';
import 'package:portfolio_site/Widgets/animated_button.dart';
import 'package:portfolio_site/Utility/size_config.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class TopMenu extends StatelessWidget {
  const TopMenu({
    Key key,
    @required ItemScrollController scrollController,
  })  : _scrollController = scrollController,
        super(key: key);

  final ItemScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 78),
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          height: SizeConfig.blockSizeHorizontal * 18,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                    wrapWords: false,
                    style: TextStyle(
                        fontSize: 25, color: GlobalTheme.secondaryColor)),
                onTap: () {
                  _scrollController.scrollTo(
                      index: 3,
                      duration: Duration(milliseconds: 1700),
                      curve: Curves.bounceIn.flipped);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
