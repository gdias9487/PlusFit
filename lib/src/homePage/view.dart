import 'package:flutter/material.dart';
import 'package:plusfit/components/constants.dart';
import 'package:plusfit/src/signInPage/view.dart';
import 'package:plusfit/widgets/Buttons.dart';
import 'package:plusfit/widgets/animations.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                  2,
                  500,
                  30.0,
                  0.0,
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/Plusfit_logo.png"),
                    )),
                  ),
                ),
                SizedBox(
                  height: 200,
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(
                          2,
                          500,
                          30.0,
                          0.0,
                          DefaultOutlinedButton(
                              color: Colors.white,
                              fontSize: 20,
                              height: 320,
                              radius: 25,
                              width: 50,
                              route: '/signup',
                              text: ('Cadastrar'))),
                      SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                          2,
                          500,
                          30.0,
                          0.0,
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: porange,
                                textStyle: defaultFont(
                                    20, FontWeight.bold, Colors.white),
                                minimumSize: Size(320, 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25))),
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: Text("Entrar"),
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 65),
              ],
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: (AssetImage("assets/back_treinos.png")),
                    fit: BoxFit.cover))));
  }
}
