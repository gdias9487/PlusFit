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
        "⚠️ Ocorreu um erro ",
        style: defaultFont(18, FontWeight.normal, Colors.black),
      ),
      content: new Text(text),
      actions: <Widget>[
        FlatButton(
          child: Text(
            "Voltar",
            style: defaultFont(18, FontWeight.normal, Colors.black),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
