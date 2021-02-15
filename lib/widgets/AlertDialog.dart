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
<<<<<<< HEAD
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
=======
        title: new Text(
          " Ocorreu um erro ",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
>>>>>>> dbd7c73a500360168ca54aa7f31d1403ff37e2e8
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
