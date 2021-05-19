import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:portfolio_site/project_widget.dart';
import 'package:portfolio_site/size_config.dart';

const List<StaggeredTile> _staggeredTiles = <StaggeredTile>[
  StaggeredTile.fit(1),
  StaggeredTile.fit(2),
  StaggeredTile.fit(1),
  StaggeredTile.fit(2)
];

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
  @override
  Widget build(BuildContext context) {
    //Cache the gifs so they load faster
    precacheImage(new AssetImage('gif/HolidayHellper2.gif'), context);
    precacheImage(new AssetImage('gif/BurgieFlip.gif'), context);
    precacheImage(new AssetImage('gif/RoleUp.gif'), context);
    return SizedBox(
      width: SizeConfig.blockSizeHorizontal * 80,
      height: SizeConfig.safeBlockVertical * 80,
      child: StaggeredGridView.count(
        crossAxisCount: 4,
        staggeredTiles: _staggeredTiles,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding: const EdgeInsets.all(10),
        children: _tiles,
      ),
    );
  }
}
