import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_site/size_config.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';
import 'dart:html' as html;

class ProjectWidget extends StatefulWidget {
  final Image image;
  final Image replaceImageOnHover;
  final String projectName;
  final String projectDescription;
  final String projectLink;

  const ProjectWidget(
      {Key key,
      @required this.image,
      this.replaceImageOnHover,
      this.projectName = 'Name Of Project',
      this.projectDescription = 'Description Of Project',
      this.projectLink = 'https://www.google.com/'})
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
        .tweenTo(Colors.black.withOpacity(0.6))
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
            onTap: () {
              setState(() {
                showDescription = !showDescription;
                if (showDescription == true) {
                  y = 0.0
                      .tweenTo(-5.0)
                      .curved(Curves.ease)
                      .animatedBy(yController);
                  yController.play(duration: 200.milliseconds);
                  colorController.play(duration: 200.milliseconds);
                } else {
                  y = 0.0
                      .tweenTo(-5.0)
                      .curved(Curves.ease)
                      .animatedBy(yController);
                  yController.playReverse(duration: 200.milliseconds);
                  colorController.playReverse(duration: 200.milliseconds);
                }
              });
            },
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
                  showDescription == false
                      ? widget.image
                      : widget.replaceImageOnHover,
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
                            left: SizeConfig.blockSizeHorizontal * 1.2,
                            top: 10,
                            child: AutoSizeText.rich(
                                TextSpan(
                                    text: widget.projectName,
                                    style: TextStyle(
                                        fontSize:
                                            SizeConfig.safeBlockHorizontal *
                                                2.5,
                                        color: showDescription == true
                                            ? Colors.white.withOpacity(0.8)
                                            : Colors.white.withOpacity(0.6))),
                                wrapWords: true),
                          ),
                          //All of this is displayed when we hover
                          Visibility(
                            visible: showDescription,
                            child: Stack(children: [
                              Positioned(
                                left: 25,
                                top: SizeConfig.safeBlockVertical * 10,
                                child: SizedBox(
                                  width: SizeConfig.blockSizeHorizontal * 20,
                                  child: AutoSizeText.rich(
                                      TextSpan(
                                          text: widget.projectDescription,
                                          style: TextStyle(
                                              fontSize: SizeConfig
                                                      .safeBlockHorizontal *
                                                  1.5,
                                              color: Colors.white)),
                                      wrapWords: true),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: InkWell(
                                    onTap: () {
                                      html.window
                                          .open(widget.projectLink, 'new tab');
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
