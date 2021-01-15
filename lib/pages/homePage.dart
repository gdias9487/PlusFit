import 'package:flutter/material.dart';
import 'package:plusfit/components/constants.dart';
import 'package:plusfit/widgets/Buttons.dart';

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
                  height: 420,
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      DefaultOutlinedButton(
                          color: Colors.white,
                          fontSize: 20,
                          height: 320,
                          radius: 25,
                          width: 50,
                          route: '/signup',
                          text: 'Cadastrar'),
                      SizedBox(
                        height: 20,
                      ),
                      DefaultElevatedButton(
                          color: porange,
                          fontSize: 20,
                          height: 320,
                          radius: 25,
                          width: 50,
                          text: 'Entrar')
                    ],
                  ),
                ),
                SizedBox(height: 65),
                Container(
                  alignment: Alignment.center,
                  width: 80,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/about');
                    },
                    child: Text(
                      "Sobre o Aplicativo",
                      style: TextStyle(
                          color: pyellow, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/main_menu_background.png"),
                    fit: BoxFit.cover))));
  }
}
