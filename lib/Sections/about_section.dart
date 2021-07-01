import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio_site/Utility/size_config.dart';

import '../Utility/Globaltheme.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                      text: ' agile ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: '''and a quick learner. 


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
}
