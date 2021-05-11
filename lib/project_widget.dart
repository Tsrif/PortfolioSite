import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class ProjectWidget extends StatefulWidget {
  final int randomPictureWidth;
  final int randomPictureHeight;

  const ProjectWidget(
      {Key key,
      @required this.randomPictureWidth,
      @required this.randomPictureHeight})
      : super(key: key);
  @override
  _ProjectWidgetState createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> with AnimationMixin {
  bool showDescription;
  bool hoveringLink;
  AnimationController colorController;
  Animation<Color> color;
  @override
  void initState() {
    showDescription = false;
    hoveringLink = false;
    colorController = createController();
    color = Colors.black
        .withOpacity(0.5)
        .tweenTo(Colors.black.withOpacity(0.8))
        .animatedBy(colorController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        //Without onTap, onHover doesn't work
        onTap: () {},
        onHover: (value) {
          if (value == true) {
            setState(() {
              showDescription = true;
              colorController.play(duration: 200.milliseconds);
            });
          } else {
            setState(() {
              showDescription = false;
              colorController.playReverse(duration: 200.milliseconds);
            });
          }
        },
        child: Container(
          decoration: new BoxDecoration(
            //color: color,
            boxShadow: [
              BoxShadow(
                  color: Color(0x3e000000),
                  offset: Offset(0, 0),
                  blurRadius: 6,
                  spreadRadius: 0)
            ],
          ),
          child: Stack(
            children: [
              Image.network(
                  "https://picsum.photos/${widget.randomPictureHeight}/${widget.randomPictureWidth}"),
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: color.value,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 20,
                        top: 10,
                        child: Text('Name of Project',
                            style: TextStyle(
                                color: showDescription == true
                                    ? Colors.white.withOpacity(0.9)
                                    : Colors.white.withOpacity(0.7),
                                fontSize: 55)),
                      ),
                      Visibility(
                        visible: showDescription,
                        child: Stack(children: [
                          Positioned(
                            left: 25,
                            top: 100,
                            child: Text('Description of the project',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22)),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: InkWell(
                                onTap: () {},
                                onHover: (value) {
                                  if (value == true) {
                                    setState(() {
                                      hoveringLink = true;
                                    });
                                  } else {
                                    setState(() {
                                      hoveringLink = false;
                                    });
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 3.0,
                                          color: hoveringLink == true
                                              ? Colors.white
                                              : Colors.transparent),
                                    ),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Link',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22)),
                                    ),
                                  ),
                                )),
                          )
                        ]),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
