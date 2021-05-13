import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:portfolio_site/project_widget.dart';

const List<StaggeredTile> _staggeredTiles = <StaggeredTile>[
  StaggeredTile.fit(1),
  StaggeredTile.fit(1),
  StaggeredTile.fit(1)
];

List<Widget> _tiles = <Widget>[
  ProjectWidget(randomPictureWidth: 500, randomPictureHeight: 500),
  ProjectWidget(randomPictureWidth: 600, randomPictureHeight: 800),
  ProjectWidget(randomPictureWidth: 800, randomPictureHeight: 1000)
];

class ProjectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 12),
        child: StaggeredGridView.count(
          crossAxisCount: 4,
          staggeredTiles: _staggeredTiles,
          mainAxisSpacing: 4,
          crossAxisSpacing: 10,
          padding: const EdgeInsets.all(4),
          children: _tiles,
        ));
  }
}
