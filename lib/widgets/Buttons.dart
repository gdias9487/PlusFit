import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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


class Bordaedit extends StatefulWidget {
  @override
  _BordaeditState createState() => _BordaeditState();
}

class _BordaeditState extends State<Bordaedit> {
    PickedFile _imagefile;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text("Escolha uma opção",style: TextStyle(
            fontSize: 20.0
          ),
          ),
          SizedBox(height:20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.camera),
                onPressed: () {
                  takedPhoto(ImageSource.camera);
                },
                label: Text("Camera"),
              ),
              FlatButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  takedPhoto(ImageSource.gallery);
                },
                label: Text("Galeria"),
              ),
            ],
          ),
        ],
      ),
    );  
    
  }
  Widget imagemPerfil() {
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 80.0,
            backgroundImage: _imagefile ==null? AssetImage("assets/homem.png") : FileImage(File(_imagefile.path)),
          ),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => Bordaedit()),
                );
              },
              child: Icon(Icons.edit, color: Colors.teal, size: 28.0,),
            ),
          ),
        ],
      ),
    );
  }
  void takedPhoto (ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
      setState(() {
        _imagefile = pickedFile;
      });
    }
}

