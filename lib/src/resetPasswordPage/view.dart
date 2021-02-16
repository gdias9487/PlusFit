import 'package:flutter/material.dart';
import 'package:plusfit/widgets/TextField.dart';
import 'package:plusfit/components/constants.dart';
import 'package:plusfit/widgets/animations.dart';

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
          child: ListView(physics: NeverScrollableScrollPhysics(), children: <
              Widget>[
            FadeAnimation(
                1.5,
                30.0,
                0.0,
                IconButton(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  alignment: Alignment.topLeft,
                  color: Colors.white,
                  icon: Icon(Icons.arrow_back_ios),
                  splashRadius: 20,
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/login');
                  },
                )),
            SizedBox(
              height: 20,
            ),
            FadeAnimation(
                1,
                30.0,
                0.0,
                SizedBox(
                    height: 200,
                    child: Image.asset("assets/Plusfit_logo.png"))),
            FadeAnimation(
                2,
                30.0,
                0.0,
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.5,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35))),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        FadeAnimation(
                          2,
                          30.0,
                          0.0,
                          Text(
                            'Redefinir Senha',
                            textAlign: TextAlign.center,
                            style:
                                defaultFont(20, FontWeight.bold, Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FadeAnimation(
                          2,
                          30.0,
                          0.0,
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 5),
                            child: Text(
                              'Insira seu endereço de email para redefinir a senha',
                              textAlign: TextAlign.center,
                              style: defaultFont(
                                  20, FontWeight.normal, Colors.black54),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          2,
                          30.0,
                          0.0,
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            obscureText: false,
                            style: defaultFont(
                                16, FontWeight.normal, pgreytextfield),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                prefixIcon: Icon(Icons.account_circle_sharp),
                                labelText: 'Email',
                                labelStyle: defaultFont(
                                    16, FontWeight.normal, pgreytextfield)),
                          ),
                        ),
                        SizedBox(
                          height: paddefault + 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 35, right: 35),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: porange,
                                textStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                minimumSize: Size(320, 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25))),
                            onPressed: () {
                              Navigator.popAndPushNamed(context, '/login');
                            },
                            child: Text("Redefinir Senha"),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          ])),
    );
  }
}
