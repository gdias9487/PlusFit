import 'package:flutter/material.dart';
import 'package:plusfit/widgets/Buttons.dart';
import 'package:plusfit/widgets/TextField.dart';
import 'package:plusfit/widgets/TextFormFieldContainer.dart';
import 'package:plusfit/widgets/TrainingContainer.dart';
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
        title: Text("Olá, Usuário!"),
        elevation: 0,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context, '/login');
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
              DefaultTextField(
                obscureText: false,
                text: 'Buscar treino',
                suffixicon: Icons.search,
              ),
              SizedBox(
                height: paddefault,
              ),
              Container(
                  child: Column(
                children: <Widget>[
                  DefaultElevatedButton(
                      color: porange,
                      fontSize: 20,
                      height: 150,
                      radius: 25,
                      width: 50,
                      text: 'Buscar'),
                ],
              )),
              SizedBox(
                height: 35,
              ),
              TrainingContainer(
                  height: 150, horizontal: 15, vertical: 10, text: 'TREINO 1'),
              TrainingContainer(
                  height: 150, horizontal: 15, vertical: 10, text: 'TREINO 2'),
              TrainingContainer(
                  height: 150, horizontal: 15, vertical: 10, text: 'TREINO 3'),
              TrainingContainer(
                  height: 150, horizontal: 15, vertical: 10, text: 'TREINO 4'),
            ]),
          )),
    );
  }
}
