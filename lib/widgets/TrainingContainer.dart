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
