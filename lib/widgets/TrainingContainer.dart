import 'package:flutter/material.dart';

class TrainingContainer extends StatelessWidget {
  final Key key;
  final double height;
  final double horizontal;
  final double vertical;
  final String text;

  const TrainingContainer(
      {this.key,
      @required this.height,
      @required this.horizontal,
      @required this.vertical,
      @required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: Container(
          height: height,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.blueGrey[50],
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(text,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          )),
    );
  }
}
