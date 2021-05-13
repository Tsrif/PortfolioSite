import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';
import 'dart:html' as html;

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
  AnimationController yController;
  Animation<Color> color;
  Animation<double> y;
  @override
  void initState() {
    showDescription = false;
    hoveringLink = false;
    colorController = createController();
    yController = createController();
    color = Colors.black
        .withOpacity(0.5)
        .tweenTo(Colors.black.withOpacity(0.8))
        .animatedBy(colorController);
    y = 0.0.tweenTo(-20.0).curved(Curves.ease).animatedBy(yController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Wrap in a container to have box shadow
    return Container(
      decoration: new BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color(0x3e000000),
              offset: Offset(10, 10),
              blurRadius: 10,
              spreadRadius: 5)
        ],
      ),
      //ClipRRect to round out the edges
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        //Transform to move object by the animated Y value
        child: Transform.translate(
          // Get animated offset
          offset: Offset(0, y.value),
          //InkWell to get input
          child: InkWell(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            //Without onTap, onHover doesn't work
            onTap: () {},
            onHover: (value) {
              if (value == true) {
                setState(() {
                  showDescription = true;
                  y = 0.0
                      .tweenTo(-5.0)
                      .curved(Curves.ease)
                      .animatedBy(yController);
                  yController.play(duration: 200.milliseconds);
                  colorController.play(duration: 200.milliseconds);
                });
              } else {
                setState(() {
                  showDescription = false;
                  y = 0.0
                      .tweenTo(-5.0)
                      .curved(Curves.ease)
                      .animatedBy(yController);
                  yController.playReverse(duration: 200.milliseconds);
                  colorController.playReverse(duration: 200.milliseconds);
                });
              }
            },
            //Container to hold the contents
            child: Container(
              child: Stack(
                children: [
                  //First up is the picture
                  Image.network(
                      "https://picsum.photos/${widget.randomPictureWidth}/${widget.randomPictureHeight}"),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    //Next we have this container to hold everything that is shown on top of the picture
                    child: Container(
                      color: color.value,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 20,
                            top: 10,
                            child: AutoSizeText.rich(
                                TextSpan(
                                    text: 'Name of Project',
                                    style: TextStyle(
                                        color: showDescription == true
                                            ? Colors.white.withOpacity(0.9)
                                            : Colors.white.withOpacity(0.7),
                                        fontSize: 55)),
                                minFontSize: 0,
                                stepGranularity: 0.1,
                                wrapWords: true),
                          ),
                          //All of this is displayed when we hover
                          Visibility(
                            visible: showDescription,
                            child: Stack(children: [
                              Positioned(
                                left: 25,
                                top: 100,
                                child: AutoSizeText(
                                    'Description of the project',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22)),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: InkWell(
                                    onTap: () {
                                      html.window.open(
                                          'https://www.google.com/', 'new tab');
                                    },
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
                                          child: AutoSizeText('Link',
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
        ),
      ),
    );
  }
}
