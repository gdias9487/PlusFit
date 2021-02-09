import 'package:flutter/material.dart';

class TrainingContainer extends StatelessWidget {
  final Key key;
  final double width;
  final double height;
  final double horizontal;
  final double vertical;
  final String text;
  final action;

  const TrainingContainer(
      {this.key,
      this.action,
      @required this.height,
      @required this.horizontal,
      @required this.vertical,
      @required this.text,
      @required this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: Container(
            width: width,
            height: height,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.blueGrey[50].withOpacity(0.2),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(text,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            )),
      ),
    );
  }
}

class ExerciseContainer extends StatelessWidget {
  final Key key;
  final double width;
  final double height;
  final double right;
  final double left;
  final double top;
  final double bottom;
  final String text;
  final String subtext;
  final action;

  const ExerciseContainer(
      {this.key,
      this.action,
      @required this.height,
      @required this.right,
      @required this.top,
      @required this.text,
      @required this.width,
      this.left,
      this.bottom, this.subtext = ''});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Padding(
        padding:
            EdgeInsets.only(right: right, left: left, top: top, bottom: bottom),
        child: Container(
            width: width,
            height: height,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blueGrey[50].withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(text,
                  textAlign: TextAlign.center,
                    style:
                    
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(subtext,
                  textAlign: TextAlign.center,
                    style:
                    
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            )),
      ),
    );
  }
}
