import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:portfolio_site/project_widget.dart';
import 'package:portfolio_site/size_config.dart';

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
    //Cache the gifs so they load faster
    precacheImage(new AssetImage('gif/HolidayHellper2.gif'), context);
    precacheImage(new AssetImage('gif/BurgieFlip.gif'), context);
    precacheImage(new AssetImage('gif/RoleUp.gif'), context);
    return SizedBox(
      width: SizeConfig.blockSizeHorizontal * 85,
      height: double.infinity,
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
