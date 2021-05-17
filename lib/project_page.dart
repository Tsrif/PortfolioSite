import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:portfolio_site/project_widget.dart';

const List<StaggeredTile> _staggeredTiles = <StaggeredTile>[
  StaggeredTile.fit(1),
  StaggeredTile.fit(2),
  //StaggeredTile.fit(1)
];

List<Widget> _tiles = <Widget>[
  ProjectWidget(
    image: Image.asset('image/Burg.png'),
    replaceImageOnHover: Image.asset('gif/BurgieFlip.gif'),
    projectName: 'Burgie',
    projectDescription:
        "2D Platformer about a hamburger Named 'Burgie' trying to escape from a fast food restaurant.",
    projectLink: "https://github.com/Tsrif/Burgie",
  ),
  ProjectWidget(
    image: Image.asset('image/HolidayHellper.png'),
    replaceImageOnHover: Image.asset('gif/HolidayHellper2.gif'),
    projectName: 'Holiday Hellper',
    projectDescription:
        "3D Stealth game where you help Krampus punish misbehaving children.",
    projectLink: "https://github.com/Tsrif/Holiday-Hellper",
  )
];

class ProjectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.count(
      crossAxisCount: 4,
      staggeredTiles: _staggeredTiles,
      mainAxisSpacing: 4,
      crossAxisSpacing: 10,
      padding: const EdgeInsets.all(4),
      children: _tiles,
    );
  }
}
