import 'package:flutter/material.dart';
import 'package:plusfit/pages/editperfilPage.dart';

class DefaultElevatedButton extends StatelessWidget {
  final Key key;
  final double fontSize;
  final double width;
  final double height;
  final double radius;
  final String text;
  final color;
  final action;

  const DefaultElevatedButton(
      {this.key,
      @required this.color,
      @required this.fontSize,
      @required this.height,
      @required this.radius,
      @required this.width,
      this.action,
      @required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: color,
          textStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
          minimumSize: Size(height, width),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius))),
      onPressed: action,
      child: Text(text),
    );
  }
}

class DefaultOutlinedButton extends StatelessWidget {
  final Key key;
  final double fontSize;
  final double width;
  final double height;
  final double radius;
  final String route;
  final String text;
  final color;

  const DefaultOutlinedButton(
      {this.key,
      @required this.color,
      @required this.fontSize,
      @required this.height,
      @required this.radius,
      @required this.width,
      @required this.route,
      @required this.text});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            primary: color,
            side: BorderSide(color: color),
            textStyle:
                TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
            minimumSize: Size(height, width),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius))),
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        child: Text(text));
  }
}
class Bordaedit extends StatelessWidget {
  Widget build(BuildContext context){
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text("Escolha uma foto de perfil",style: TextStyle(
            fontSize: 20.0
          ),
          ),
          SizedBox(height:20),
          Row(
            children: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.camera),
                onPressed: () {

                },
                label: Text("Camera"),
              ),
              FlatButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {

                },
                label: Text("Galeria"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}