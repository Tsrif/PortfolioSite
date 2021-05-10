import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';
import 'corner_decoration.dart';
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
//               child: MyAnimatedWidget(),
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
                  width: 115,
                  color: GlobalTheme.primaryColor,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text('Ricky',
                          style: TextStyle(
                              fontSize: 22, color: GlobalTheme.primaryGreen)),
                      Text('Rivera',
                          style: TextStyle(
                              fontSize: 22, color: GlobalTheme.primaryGreen)),
                      Divider(thickness: 3),
                      AnimatedButton(
                        child: Text('Home',
                            textAlign: TextAlign.right,
                            style:
                                TextStyle(fontSize: 28, color: Colors.white)),
                        onTap: () {
                          _scrollController.scrollTo(
                              index: 0,
                              duration: Duration(seconds: 1),
                              curve: Curves.bounceIn.flipped);
                        },
                      ),
                      SizedBox(height: 10),
                      AnimatedButton(
                        child: Text('About',
                            textAlign: TextAlign.right,
                            style:
                                TextStyle(fontSize: 28, color: Colors.white)),
                        onTap: () {
                          _scrollController.scrollTo(
                              index: 1,
                              duration: Duration(seconds: 1),
                              curve: Curves.bounceIn.flipped);
                        },
                      ),
                      SizedBox(height: 10),
                      AnimatedButton(
                        child: Text('Projects',
                            textAlign: TextAlign.right,
                            style:
                                TextStyle(fontSize: 25, color: Colors.white)),
                        onTap: () {
                          _scrollController.scrollTo(
                              index: 2,
                              duration: Duration(seconds: 1),
                              curve: Curves.bounceIn.flipped);
                        },
                      ),
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
                        _createCard(
                            context,
                            Text('Home Section',
                                style: TextStyle(color: Colors.white))),
                        _createCard(
                            context,
                            Text('About Section',
                                style: TextStyle(color: Colors.white))),
                        _createCard(
                            context,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                sectionContentBox(context),
                                sectionContentBox(context)
                              ],
                            )),
                      ][index];
                    },
                  )),
            ),
          ],
        ));
  }
}

_createCard(BuildContext context, Widget content) {
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
            child: Center(child: content),
            color: GlobalTheme.appBarColor),
      ));
}

class AnimatedButton extends StatefulWidget {
  final Widget child;
  final onTap;

  const AnimatedButton({Key key, this.child, this.onTap}) : super(key: key);
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
    color = Colors.transparent
        .tweenTo(GlobalTheme.primaryBlue)
        .animatedBy(colorController);
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
          decoration: CornerDecoration(
            strokeWidth: 4,
            strokeColor: color.value,
            insets: EdgeInsets.all(16),
            cornerSide: CornerSide.all(16, 48),
            fillTop: 0.0,
            fillBottom: 0.0,
          ),
          child: widget.child,
          //color: color.value,
        ),
      ),
    );
  }
}

sectionContentBox(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: Container(
      width: MediaQuery.of(context).size.width / 5,
      height: 400,
      decoration: ConcaveDecoration(
          depression: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          colors: [Color(0x3e000000), Color(0XFF4D4A50)]),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10.0),
          Center(
            child: Text(
              'Project Name',
              style: TextStyle(fontSize: 32, color: Color(0XFFE6E3E9)),
            ),
          ),
          SizedBox(height: 10.0),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 6,
              child: Text(
                "I don't know. Maybe put like the project description here?",
                style: TextStyle(fontSize: 15, color: Color(0XFFE6E3E9)),
              ),
            ),
          ),
          SizedBox(height: 50),
          CarouselSlider(
              items: [
                Image.network('https://picsum.photos/250?image=9'),
                Image.network('https://picsum.photos/250?image=10'),
                Image.network('https://picsum.photos/250?image=11'),
                Image.network('https://picsum.photos/250?image=12')
              ],
              options: CarouselOptions(
                height: 200,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: false,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                //onPageChanged: callbackFunction,
                scrollDirection: Axis.horizontal,
              ))
        ],
      ),
    ),
  );
}
