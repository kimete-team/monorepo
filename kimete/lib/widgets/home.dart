import 'package:flutter/material.dart';
import 'package:kimete/widgets/cards_section_alignment.dart';
import 'package:kimete/widgets/cards_section_draggable.dart';

class Home extends StatelessWidget {
  bool showAlignmentCards = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          showAlignmentCards
            ? CardsSectionAlignment(context)
            : CardsSectionDraggable(),
          buttonRow()
        ],
      ),
    );
  }
  Widget buttonRow() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 48.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            mini: true,
            onPressed: (){},
            backgroundColor: Colors.white,
            child: Icon(Icons.loop, color: Colors.yellow),
          ),
          Padding(padding: EdgeInsets.only(right: 8.0)),
          FloatingActionButton(
            onPressed: (){},
            backgroundColor: Colors.white,
            child: Icon(Icons.close, color: Colors.red),
          ),
          Padding(padding: EdgeInsets.only(right: 8.0)),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.white,
            child: Icon(Icons.favorite, color: Colors.green),
          ),
          Padding(padding: EdgeInsets.only(right: 8.0)),
          FloatingActionButton(
            mini: true,
            onPressed: () {},
            backgroundColor: Colors.white,
            child: Icon(Icons.star, color: Colors.blue),
          ),
        ],
      )
    );
  }
}