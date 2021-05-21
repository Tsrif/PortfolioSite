import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:portfolio_site/project_widget.dart';
import 'package:portfolio_site/size_config.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'Globaltheme.dart';

List<Widget> _tiles = <Widget>[
  ProjectWidget(
    image: Image.asset('image/Burg.png', gaplessPlayback: true),
    replaceImageOnHover:
        Image.asset('gif/BurgieFlip.gif', gaplessPlayback: true),
    projectName: 'Burgie',
    projectDescription:
        "2D Platformer about a hamburger Named 'Burgie' trying to escape from a fast food restaurant.",
    projectLink: "https://github.com/Tsrif/Burgie",
  ),
  ProjectWidget(
    image: Image.asset('image/HolidayHellper.png', gaplessPlayback: true),
    replaceImageOnHover:
        Image.asset('gif/HolidayHellper2.gif', gaplessPlayback: true),
    projectName: 'Holiday Hellper',
    projectDescription:
        "3D Stealth game where you help Krampus punish misbehaving children.",
    projectLink: "https://github.com/Tsrif/Holiday-Hellper",
  ),
  ProjectWidget(
    image: Image.asset('image/RoleUp.png', gaplessPlayback: true),
    replaceImageOnHover: Image.asset('gif/RoleUp.gif', gaplessPlayback: true),
    projectName: 'RoleUp',
    projectDescription:
        "Currently in development. Character Creator App for Pathfinder, D&D, and D20 Systems.",
    projectLink: "https://play.google.com/store/apps/details?id=com.RoleUp",
  ),
  ProjectWidget(
    image: Image.asset('image/Site.png', gaplessPlayback: true),
    replaceImageOnHover: Image.asset('image/Site.png', gaplessPlayback: true),
    projectName: 'Portfolio Site',
    projectDescription: "Personal website to showcase skills.",
    projectLink: "https://github.com/Tsrif/PortfolioSite",
  ),
];

class ProjectPage extends StatelessWidget {
  final bool isMobile;

  const ProjectPage({Key key, this.isMobile}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<StaggeredTile> _staggeredTiles = <StaggeredTile>[
      StaggeredTile.fit(isMobile == false ? 1 : 3),
      StaggeredTile.fit(isMobile == false ? 2 : 3),
      StaggeredTile.fit(isMobile == false ? 1 : 3),
      StaggeredTile.fit(isMobile == false ? 2 : 3)
    ];
    TextStyle headerStyle = TextStyle(
        color: Colors.white, fontSize: SizeConfig.safeBlockHorizontal * 11);
    TextStyle headerStyle2 = TextStyle(
        color: GlobalTheme.primaryPurple,
        fontSize: SizeConfig.safeBlockHorizontal * 11);
    //Cache the gifs so they load faster
    precacheImage(new AssetImage('gif/HolidayHellper2.gif'), context);
    precacheImage(new AssetImage('gif/BurgieFlip.gif'), context);
    precacheImage(new AssetImage('gif/RoleUp.gif'), context);
    return Stack(
      children: [
        Transform.translate(
          offset: Offset(SizeConfig.blockSizeHorizontal * 20, 0),
          child: SizedBox(
            width: SizeConfig.blockSizeHorizontal * 50,
            height: SizeConfig.blockSizeVertical * 80,
            child: (Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AutoSizeText.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: "Pro", style: headerStyle),
                      TextSpan(text: "jects", style: headerStyle2)
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
              ],
            )),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: SizeConfig.safeBlockHorizontal * 16),
          child: StaggeredGridView.count(
            crossAxisCount: 4,
            staggeredTiles: _staggeredTiles,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            padding: const EdgeInsets.all(10),
            children: _tiles,
          ),
        )
      ],
    );
  }
}
