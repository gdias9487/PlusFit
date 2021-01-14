import 'package:flutter/material.dart';
import 'package:plusfit/components/assets.dart';
import 'package:plusfit/components/constants.dart';

class ExercisePage extends StatefulWidget {
  ExercisePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  @override
  Widget build(BuildContext context) {
    final ScrollController cont = ScrollController();
    void scroll() {
      cont.animateTo(0,
          duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Olá, Usuário !"),
        elevation: 0,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/sign_up_background.png"),
                  fit: BoxFit.cover)),
          child: Container(
            child: ListView(controller: cont, children: <Widget>[
              Container(
                  height: 110,
                  width: 110,
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.person),
                        tooltip: 'Profile page',
                        color: porange,
                        iconSize: 90.0,
                        onPressed: () {
                          Navigator.pushNamed(context, '/perfil');
                        },
                      ),
                    ],
                  )),
              TextFieldContainer(
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: new TextStyle(color: Colors.black, fontSize: 18),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      fillColor: Colors.blue,
                      prefixIcon: Icon(Icons.search),
                      labelText: 'Buscar Treino',
                      labelStyle: TextStyle(color: pgreytextfield)),
                ),
              ),
              SizedBox(
                height: paddefault,
              ),
              Container(
                  child: Column(
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: porange,
                        textStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        minimumSize: Size(150, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    onPressed: () {},
                    child: Text("Buscar"),
                  ),
                ],
              )),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Container(
                    height: 150,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey[50],
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 5,
                        ),
                        Text('TREINO 1',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Container(
                    height: 150,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey[50],
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("TREINO 2",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Container(
                    height: 150,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey[50],
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text('TREINO 3',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Container(
                    height: 150,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey[50],
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text('TREINO 4',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    )),
              ),
            ]),
          )),
    );
  }
}
