import 'package:flutter/material.dart';
import 'package:plusfit/main.dart';
import 'package:plusfit/loginpage.dart';
import 'package:plusfit/components/constants.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            elevation: 0,
            color: Colors.white.withOpacity(0.5),
            child: Container(
              height: 75,
              child: Row(
                children: <Widget>[],
              ),
            )),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/home_background.png"),
                  fit: BoxFit.cover)),
          // child: ListView(
          //   children: <Widget>[
          //     SizedBox(
          //       height: 590,
          //     ),
          //     Row(
          //       children: <Widget>[
          //         SizedBox(
          //           width: 20,
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           height: 60,
          //           width: 350,
          //           child: Text("fodase"),
          //           decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(40),
          //               color: Colors.white30.withOpacity(0.5)),
          //         )
          //       ],
          //     ),
          //   ],
          // ),
        ));
  }
}
