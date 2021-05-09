import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';
import 'splash.dart';

import 'Globaltheme.dart';

void main() {
  runApp(MyApp());
}

// Create enum that defines the animated properties
enum AniProps { x, y }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ricky's Portfolio",
      theme: GlobalTheme.darkTheme,
      home: Center(
        child: Splash(
            miliseconds: 700,
            navigateAfterSeconds: MyHomePage(title: 'Demo'),
            image: Image.asset('gif/glitchyhead.gif'),
            backgroundColor: Colors.black,
            photoSize: 300.0),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: SafeArea(
//           // put DevTools very high in the widget hierarchy
//           child: AnimationDeveloperTools(
//             child: Center(
//               child: AnimatedButton(
//                 child: Text('piss and shit bruv'),
//                 onTap: () => print('and I oop'),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ItemScrollController _scrollController = ItemScrollController();

  @override
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        primary: true,
        backgroundColor: GlobalTheme.primaryColor,
        body: Stack(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: 100,
                  color: GlobalTheme.primaryColor,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text('Ricky',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30)),
                      Text('Rivera',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30)),
                      Divider(thickness: 3),
                      AnimatedButton(
                        child: Text('Home', style: TextStyle(fontSize: 28)),
                        onTap: () {
                          _scrollController.scrollTo(
                              index: 0,
                              duration: Duration(seconds: 1),
                              curve: Curves.bounceIn.flipped);
                        },
                      ),
                      SizedBox(height: 20),
                      AnimatedButton(
                        child: Text('About', style: TextStyle(fontSize: 28)),
                        onTap: () {
                          _scrollController.scrollTo(
                              index: 1,
                              duration: Duration(seconds: 1),
                              curve: Curves.bounceIn.flipped);
                        },
                      ),
                      SizedBox(height: 20),
                      AnimatedButton(
                        child: Text('Projects', style: TextStyle(fontSize: 25)),
                        onTap: () {
                          _scrollController.scrollTo(
                              index: 2,
                              duration: Duration(seconds: 1),
                              curve: Curves.bounceIn.flipped);
                        },
                      ),
                      // _createNavButton(_scrollController,
                      //     GlobalTheme.primaryBlue, 'Home', 0),
                      // _createNavButton(_scrollController,
                      //     GlobalTheme.primaryGreen, 'About', 1),
                      // _createNavButton(_scrollController,
                      //     GlobalTheme.primaryRed, 'Projects', 2)
                    ],
                  ),
                )),
            Positioned.fill(
              left: 96,
              child: Align(
                  alignment: Alignment.centerRight,
                  child: ScrollablePositionedList.builder(
                    itemScrollController: _scrollController,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return [
                        _createCard(context, 'Home Section'),
                        _createCard(context, 'About Section'),
                        _createCard(context, 'Projects Section'),
                      ][index];
                    },
                  )),
            ),
          ],
        ));
  }
}

_createCard(BuildContext context, String text) {
  return SizedBox(
      height: MediaQuery.of(context).size.width / 2.0,
      width: MediaQuery.of(context).size.width / 1.1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
            shape: RoundedRectangleBorder(
              //side: BorderSide(color: Colors.transparent, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Text(text)),
            color: GlobalTheme.appBarColor),
      ));
}

class AnimatedButton extends StatefulWidget {
  final Widget child;
  final onTap;

  const AnimatedButton({Key key, this.child, this.onTap}) : super(key: key);
  @override
  _MyAnimatedWidgetState createState() => _MyAnimatedWidgetState();
}

class _MyAnimatedWidgetState extends State<AnimatedButton> with AnimationMixin {
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
    color = Colors.red.tweenTo(Colors.blue).animatedBy(colorController);
    x = 0.0.tweenTo(0).animatedBy(xController);
    y = 0.0.tweenTo(-20.0).curved(Curves.ease).animatedBy(yController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        } else {
          y = 0.0.tweenTo(-5.0).curved(Curves.ease).animatedBy(yController);
          yController.playReverse(duration: 200.milliseconds);
        }
      },
      child: Transform.translate(
        // Get animated offset
        offset: Offset(x.value, y.value),
        child: widget.child,
      ),
    );
  }
}
