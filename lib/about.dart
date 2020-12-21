import 'package:flutter/material.dart';
import 'package:plusfit/components/assets.dart';
import 'package:plusfit/components/constants.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  var _viewpass = Icons.visibility_off;
  bool _obscureText = true;
  var _viewpass1 = Icons.visibility_off;
  bool _obscureText1 = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
      if (_obscureText) {
        _viewpass = Icons.visibility_off;
      } else {
        _viewpass = Icons.visibility;
      }
    });
  }

  void _toggle1() {
    setState(() {
      _obscureText1 = !_obscureText1;
      if (_obscureText1) {
        _viewpass1 = Icons.visibility_off;
      } else {
        _viewpass1 = Icons.visibility;
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/sign_up_background.png"),
                  fit: BoxFit.cover)),
          child: ListView(children: <Widget>[
            SizedBox(
              height: 30,
            ),
            SizedBox(
                height: 100,
                width: 100,
                child: Image.asset("assets/Plusfit_logo.png")),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: Container(
                  height: 1200,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 50,
            ),
          ])),
    );
  }
}
