import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio_site/Utility/size_config.dart';

import '../Utility/Globaltheme.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({Key key}) : super(key: key);
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
                TextSpan(text: "Con", style: headerStyle),
                TextSpan(text: "tact", style: headerStyle2)
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
        ],
      )),
    );
  }
}
