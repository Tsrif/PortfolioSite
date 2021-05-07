import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio_site/Globaltheme.dart';

class VerticalAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: 100,
      color: GlobalTheme.appBarColor,
      child: Column(
        children: [
          Container(
              width: 200,
              height: 200,
              child: ElevatedButton(onPressed: () {}, child: Text('Home'))),
                        Container(
              width: 200,
              height: 200,
              child: ElevatedButton(onPressed: () {}, child: Text('About'))),
                        Container(
              width: 200,
              height: 200,
              child: ElevatedButton(onPressed: () {}, child: Text('Projects')))
        ],
      ),
    );
  }
}
