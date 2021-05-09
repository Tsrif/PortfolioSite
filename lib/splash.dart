library splash;

import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  /// Seconds to navigate after for time based navigation
  final int miliseconds;

  /// Page background color
  final Color backgroundColor;

  /// The page where you want to navigate if you have chosen time based navigation
  final dynamic navigateAfterSeconds;

  /// Main image size
  final double photoSize;

  /// Main image mainly used for logos and like that
  final Image image;

  ///  Background image for the entire screen
  final ImageProvider imageBackground;

  /// Background gradient for the entire screen
  final Gradient gradientBackground;

  /// Use one of the provided factory constructors instead of.
  @protected
  Splash({
    this.miliseconds,
    this.photoSize,
    this.navigateAfterSeconds,
    this.backgroundColor = Colors.white,
    this.image,
    this.imageBackground,
    this.gradientBackground,
  });

  factory Splash.timer(
          {@required int miliseconds,
          Color backgroundColor,
          double photoSize,
          Image image,
          dynamic navigateAfterSeconds,
          ImageProvider imageBackground,
          Gradient gradientBackground}) =>
      Splash(
        miliseconds: miliseconds,
        photoSize: photoSize,
        backgroundColor: backgroundColor,
        image: image,
        navigateAfterSeconds: navigateAfterSeconds,
        imageBackground: imageBackground,
        gradientBackground: gradientBackground,
      );

  factory Splash.network(
          {@required Future<dynamic> navigateAfterFuture,
          Color backgroundColor,
          double photoSize,
          Image image,
          dynamic navigateAfterSeconds,
          ImageProvider imageBackground,
          Gradient gradientBackground}) =>
      Splash(
          photoSize: photoSize,
          backgroundColor: backgroundColor,
          image: image,
          navigateAfterSeconds: navigateAfterSeconds,
          imageBackground: imageBackground,
          gradientBackground: gradientBackground);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(Duration(milliseconds: widget.miliseconds), () {
      if (widget.navigateAfterSeconds is String) {
        // It's fairly safe to assume this is using the in-built material
        // named route component
        Navigator.of(context).pushReplacementNamed(widget.navigateAfterSeconds);
      } else if (widget.navigateAfterSeconds is Widget) {
        Navigator.of(context).pushReplacement(new MaterialPageRoute(
            builder: (BuildContext context) => widget.navigateAfterSeconds));
      } else {
        throw new ArgumentError(
            'widget.navigateAfterSeconds must either be a String or Widget');
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          /// Image background / gradient background
          new Container(
            decoration: new BoxDecoration(
              image: widget.imageBackground == null
                  ? null
                  : new DecorationImage(
                      fit: BoxFit.cover,
                      image: widget.imageBackground,
                    ),
              gradient: widget.gradientBackground,
              color: widget.backgroundColor,
            ),
          ),

          /// The image
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Expanded(
                flex: 2,
                child: new Container(
                    child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Hero(
                        tag: "splashscreenImage",
                        child: new Container(child: widget.image),
                      ),
                      radius: widget.photoSize,
                    ),
                  ],
                )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
