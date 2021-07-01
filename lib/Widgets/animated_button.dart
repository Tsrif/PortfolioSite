import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';
import 'corner_decoration.dart';

import '../Utility/Globaltheme.dart';

class AnimatedButton extends StatefulWidget {
  final Widget child;
  final onTap;
  final bool cornerDecoration;

  const AnimatedButton(
      {Key key, this.child, this.onTap, this.cornerDecoration = true})
      : super(key: key);
  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> with AnimationMixin {
  AnimationController colorController;
  AnimationController xController;
  AnimationController yController;

  Animation<Color> color;
  Animation<double> x;
  Animation<double> y;

  @override
  void initState() {
    xController = createController();
    yController = createController();
    colorController = createController();
    x = 0.0.tweenTo(0).animatedBy(xController);
    y = 0.0.tweenTo(-20.0).curved(Curves.ease).animatedBy(yController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    color = Colors.transparent
        .tweenTo(GlobalTheme.primaryColor.withOpacity(0.8))
        .animatedBy(colorController);
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => widget.onTap(),
      onHover: (value) {
        if (value == true) {
          y = 0.0.tweenTo(-5.0).curved(Curves.ease).animatedBy(yController);
          yController.play(duration: 200.milliseconds);
          colorController.play(duration: 100.milliseconds);
        } else {
          y = 0.0.tweenTo(-5.0).curved(Curves.ease).animatedBy(yController);
          yController.playReverse(duration: 200.milliseconds);
          colorController.playReverse(duration: 100.milliseconds);
        }
      },
      child: Transform.translate(
        // Get animated offset
        offset: Offset(x.value, y.value),
        child: Container(
          decoration: widget.cornerDecoration == true
              ? CornerDecoration(
                  strokeWidth: 4,
                  strokeColor: color.value,
                  insets: EdgeInsets.all(16),
                  cornerSide: CornerSide.all(16, 48),
                  fillTop: 0.0,
                  fillBottom: 0.0,
                )
              : null,
          child: widget.child,
          //color: color.value,
        ),
      ),
    );
  }
}
