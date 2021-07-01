import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio_site/Utility/size_config.dart';

import '../Utility/Globaltheme.dart';

class HomeSection extends StatelessWidget {
  final bool isMobile;

  const HomeSection({Key key, this.isMobile}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                    //height: SizeConfig.blockSizeVertical * 10,
                    child: AnimatedTextKit(repeatForever: true, animatedTexts: [
                      TypewriterAnimatedText(
                        ' Programmer',
                        textStyle: animatedText,
                        //duration: Duration(milliseconds: 2500)
                      ),
                      TypewriterAnimatedText(
                        ' Musician',
                        textStyle: animatedText,
                        //duration: Duration(milliseconds: 2500)
                      ),
                      TypewriterAnimatedText(
                        ' Cat Lover',
                        textStyle: animatedText,
                        //duration: Duration(milliseconds: 2000)
                      ),
                    ]),
                  )
                ],
              ))
        ],
      )),
    );
  }
}
