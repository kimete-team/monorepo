import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

class Home extends StatefulWidget {
  @override
  _ExampleHomePageState createState() => _ExampleHomePageState();
}

class _ExampleHomePageState extends State<Home>
    with TickerProviderStateMixin {
  List<String> welcomeImages = [
    "https://raw.githubusercontent.com/ShaunRain/flutter_tindercard/master/assets/welcome0.png",
    "https://raw.githubusercontent.com/ShaunRain/flutter_tindercard/master/assets/welcome1.png",
    "https://raw.githubusercontent.com/ShaunRain/flutter_tindercard/master/assets/welcome2.png",
  ];

  @override
  Widget build(BuildContext context) {
    CardController controller; //Use this to trigger swap.

    return new Scaffold(
      body: new Center(
          child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              child: new TinderSwapCard(
                  orientation: AmassOrientation.BOTTOM,
                  totalNum: welcomeImages.length,
                  stackNum: 3,
                  swipeEdge: 4.0,
                  maxWidth: MediaQuery.of(context).size.width * 0.9,
                  maxHeight: MediaQuery.of(context).size.width * 0.9,
                  minWidth: MediaQuery.of(context).size.width * 0.8,
                  minHeight: MediaQuery.of(context).size.width * 0.8,
                  cardBuilder: (context, index) => Card(
                        child: Image.network('${welcomeImages[index]}'),
                      ),
                  cardController: controller = CardController(),
                  swipeUpdateCallback:
                      (DragUpdateDetails details, Alignment align) {
                    /// Get swiping card's alignment
                    if (align.x < 0) {
                      //Card is LEFT swiping
                    } else if (align.x > 0) {
                      //Card is RIGHT swiping
                    }
                  },
                  swipeCompleteCallback:
                      (CardSwipeOrientation orientation, int index) {
                    /// Get orientation & index of swiped card!
                  },
              ),
          ),
      ),
    );
  }
}