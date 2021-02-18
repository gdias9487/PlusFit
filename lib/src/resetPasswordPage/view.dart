import 'package:flutter/material.dart';
import 'package:plusfit/widgets/AlertDialog.dart';
import 'package:plusfit/components/constants.dart';
import 'package:plusfit/widgets/animations.dart';
import 'package:provider/provider.dart';

import '../../authentication.dart';
import 'controller.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  Controller _controller = Controller();
  final TextEditingController _emailController = TextEditingController();
  void _showDialog(text) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return FadeAnimation(
              1,
              500,
              0.0,
              0.0,
              Alert_Box(
                title: "Sucesso",
                buttons: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Voltar",
                        style: defaultFont(14, FontWeight.bold, porange),
                      ))
                ],
                text: text,
              ));
        });
  }

  bool validateAndSave() {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      return true;
    } else {
      return false;
    }
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        context
            .read<AuthenticationService>()
            .resetPassword(_emailController.text.trim())
            .then((value) {
          _showDialog("Foi enviado uma mensagem para seu endereço de e-mail.");
        }).catchError((e) => {_showDialog(error)});

        return null;
      } catch (e) {}
    }
  }

  String validateemail(value) {
    if (value.isEmpty) {
      return "Campo obrigatório *";
    } else if (!(value.contains('@') && value.contains('.com'))) {
      return "Digite um email válido *";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.black,
          child: ListView(children: <Widget>[
            FadeAnimation(
                0,
                1000,
                30.0,
                0.0,
                IconButton(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  alignment: Alignment.topLeft,
                  color: Colors.white,
                  icon: Icon(Icons.arrow_back_ios),
                  splashRadius: 20,
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/login');
                  },
                )),
            FadeAnimation(
                0,
                800,
                30.0,
                0.0,
                SizedBox(
                    height: 250,
                    child: Image.asset("assets/Plusfit_logo.png"))),
            FadeAnimation(
                0,
                900,
                800.0,
                0.0,
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Container(
                    height: (MediaQuery.of(context).size.height / 2) + 20,
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
                        Text(
                          'Redefinir Senha',
                          textAlign: TextAlign.center,
                          style: defaultFont(20, FontWeight.bold, Colors.black),
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
                            style: defaultFont(
                                20, FontWeight.normal, Colors.black54),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Form(
                            key: _formkey,
                            child: TextFormField(
                              controller: _emailController,
                              validator: validateemail,
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
                            )),
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
                              validateAndSubmit();
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
