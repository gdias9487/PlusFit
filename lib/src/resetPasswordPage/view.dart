import 'package:flutter/material.dart';
import 'package:plusfit/widgets/TextField.dart';
import 'package:plusfit/components/constants.dart';

import 'controller.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  Controller _controller = Controller();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/login_background.png"),
                  fit: BoxFit.cover)),
          child: ListView(children: <Widget>[
            IconButton(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              alignment: Alignment.topLeft,
              color: Colors.white,
              icon: Icon(Icons.arrow_back_ios),
              splashRadius: 20,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                height: 170,
                width: 150,
                child: Image.asset("assets/Plusfit_logo.png")),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35, vertical: 30),
              child: Container(
                height: 290,
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
                    Text(
                      'Redefinir Senha',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                      child: Text(
                        'Insira seu endereço de email para redefinir a senha',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      style: defaultFont(16, FontWeight.normal, Colors.black),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          prefixIcon: Icon(Icons.account_circle_sharp),
                          labelText: 'Email',
                          labelStyle: defaultFont(
                              16, FontWeight.normal, pgreytextfield)),
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
                              minimumSize: Size(320, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25))),
                          onPressed: () {
                            _controller
                                .resetPassword(_emailController.text.trim());
                          },
                          child: Text("Redefinir Senha"),
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
