import 'package:flutter/material.dart';
import 'package:plusfit/components/assets.dart';
import 'package:plusfit/components/constants.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background1.png"),
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
                            labelText: 'E-mail',
                            labelStyle: TextStyle(color: pgreytextfield)),
                      ),
                    ),
                    SizedBox(
                      height: paddefault,
                    ),
                    TextFieldContainer(
                      child: TextField(
                        obscureText: true,
                        style: new TextStyle(color: Colors.black, fontSize: 18),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                            prefixIcon: Icon(Icons.lock_outline),
                            suffixIcon: Icon(Icons.visibility_off),
                            labelText: 'Senha',
                            labelStyle: TextStyle(color: pgreytextfield)),
                      ),
                    ),
                    SizedBox(
                      height: paddefault,
                    ),
                    TextFieldContainer(
                      child: TextField(
                        obscureText: true,
                        style: new TextStyle(color: Colors.black, fontSize: 18),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                            prefixIcon: Icon(Icons.lock_outline),
                            suffixIcon: Icon(Icons.visibility_off),
                            labelText: 'Confirmar Senha',
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
                          child: Text("Sign up"),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ])),
    );
  }
}
