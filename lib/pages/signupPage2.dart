import 'package:flutter/material.dart';
import 'package:plusfit/components/assets.dart';
import 'package:plusfit/components/constants.dart';

class SignupprfPage extends StatefulWidget {
  SignupprfPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignupprfPageState createState() => _SignupprfPageState();
}

class _SignupprfPageState extends State<SignupprfPage> {
  @override
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
                height: 150,
                width: 150,
                child: Image.asset("assets/Plusfit_logo.png")),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35, vertical: 30),
              child: Container(
                height: 320,
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
                    TextFieldContainer(
                      child: TextField(
                        style: new TextStyle(color: Colors.black, fontSize: 18),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                            fillColor: Colors.blue,
                            prefixIcon: Icon(Icons.account_circle),
                            labelText: 'Nome completo',
                            labelStyle: TextStyle(color: pgreytextfield)),
                      ),
                    ),
                    SizedBox(
                      height: paddefault,
                    ),
                    Row(
                      children: <Widget>[
                        TextFieldContainer(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            style: new TextStyle(
                                color: Colors.black, fontSize: 18),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                fillColor: Colors.blue,
                                prefixIcon: Icon(Icons.line_weight),
                                labelText: 'Peso (kg)',
                                labelStyle: TextStyle(color: pgreytextfield)),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TextFieldContainer(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            style: new TextStyle(
                                color: Colors.black, fontSize: 18),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                fillColor: Colors.blue,
                                prefixIcon: Icon(Icons.height),
                                labelText: 'Altura (cm)',
                                labelStyle: TextStyle(color: pgreytextfield)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: paddefault,
                    ),
                    TextFieldContainer(
                      child: TextField(
                        keyboardType: TextInputType.datetime,
                        style: new TextStyle(color: Colors.black, fontSize: 18),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                            fillColor: Colors.blue,
                            prefixIcon: Icon(Icons.calendar_today),
                            labelText: 'Data de Nascimento (DD/MM/AAAA)',
                            labelStyle: TextStyle(color: pgreytextfield)),
                      ),
                    ),
                    SizedBox(
                      height: padbutton,
                    ),
                    Container(
                        child: Column(
                      children: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: porange,
                              textStyle: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              minimumSize: Size(320, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25))),
                          onPressed: () {},
                          child: Text("Cadastrar"),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 65,
            ),
            Container(
              height: 32,
              child: Row(
                children: [
                  SizedBox(
                    width: 110,
                  ),
                  Text(
                    "Possui uma Conta?",
                    textAlign: TextAlign.right,
                    style: TextStyle(color: pyellow),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    width: 80,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text(
                        "Entrar",
                        style: TextStyle(
                            color: pyellow, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ])),
    );
  }
}
