import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

class Home extends StatefulWidget {
  @override
  _ExampleHomePageState createState() => _ExampleHomePageState();
}

class _ExampleHomePageState extends State<Home>
    with TickerProviderStateMixin {
  List<String> welcomeImages1 = [
    "https://raw.githubusercontent.com/ShaunRain/flutter_tindercard/master/assets/welcome0.png",
    "https://raw.githubusercontent.com/ShaunRain/flutter_tindercard/master/assets/welcome1.png",
    "https://raw.githubusercontent.com/ShaunRain/flutter_tindercard/master/assets/welcome2.png",
  ];
  List<Map<String, dynamic>> welcomeImages = [
    {
      "imageUrl": "https://raw.githubusercontent.com/ShaunRain/flutter_tindercard/master/assets/welcome0.png",
      "title": "title"
    },
    {
      "imageUrl": "https://raw.githubusercontent.com/ShaunRain/flutter_tindercard/master/assets/welcome1.png",
      "title": "title"
    },
    {
      "imageUrl": "https://raw.githubusercontent.com/ShaunRain/flutter_tindercard/master/assets/welcome2.png",
      "title": "title"
    },
  ];

  @override
  Widget build(BuildContext context) {
    CardController controller; //Use this to trigger swap.

    return new Scaffold(
      body: Center(
          child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              child: TinderSwapCard(
                  orientation: AmassOrientation.BOTTOM,
                  totalNum: welcomeImages.length,
                  stackNum: 3,
                  swipeEdge: 4.0,
                  maxWidth: MediaQuery.of(context).size.width * 0.9,
                  maxHeight: MediaQuery.of(context).size.width * 0.9,
                  minWidth: MediaQuery.of(context).size.width * 0.8,
                  minHeight: MediaQuery.of(context).size.width * 0.8,
                  cardBuilder: (context, index) {
                    Map<String, dynamic> cardInfo = welcomeImages[index];
                    return Card(
                        child: Stack(
                          children: <Widget>[
                            SizedBox.expand(
                                child: Image.network('${cardInfo["imageUrl"]}')
                            ),

                            SizedBox.expand(
                              child: Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [Colors.transparent, Colors.black54],
                                        begin: Alignment.center,
                                        end: Alignment.bottomCenter)),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(cardInfo["title"],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w700)),
                                      Padding(padding: EdgeInsets.only(bottom: 8.0)),
                                      Text('A short description.',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(color: Colors.white)),
                                    ],
                                  )),
                            )
                          ],
                        )
                      );
                  },
                  cardController: controller = CardController(),
                  swipeUpdateCallback:
                      (DragUpdateDetails details, Alignment align) {
                    /// Get swiping card's alignment
                    if (align.x < 0) {
                      //Card is LEFT swiping
                    } else if (align.x > 5) {
                      //Card is RIGHT swiping
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("sample"),
                            content: Text("content"),
                            actions: <Widget>[
                              FlatButton(
                                child: Text("Cancel"),
                                onPressed: ()=>Navigator.pop(context),
                              ),
                              FlatButton(
                                child: Text("Done!"),
                                onPressed: ()=>SystemNavigator.pop(),
                              )
                            ],
                          );
                        }
                      );
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