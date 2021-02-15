import 'package:flutter/material.dart';
import 'package:plusfit/components/constants.dart';

class Alert_Box extends StatelessWidget {
  final Key key;
  final text;
  final action;

  const Alert_Box({this.text, this.key, this.action});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: new Text(
          " Ocorreu um erro ",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        content: new Text(text),
        actions: <Widget>[
          FlatButton(
            child: Text("Voltar"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))));
  }
}
