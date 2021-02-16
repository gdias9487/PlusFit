import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plusfit/components/constants.dart';
import 'package:plusfit/src/homePage/view.dart';
import 'package:plusfit/widgets/AlertDialog.dart';
import 'package:plusfit/widgets/animations.dart';
import 'package:provider/provider.dart';
import 'package:plusfit/authentication.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var _viewpass = Icons.visibility_off;
  bool _obscureText = true;

  @override
  void _showDialog(text) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Alert_Box(
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
          );
        });
  }

  // ignore: override_on_non_overriding_member
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
            .singIn(
                email: emailController.text.trim(),
                password: passwordController.text.trim())
            .then((value) => Navigator.popAndPushNamed(context, '/exercises'))
            // ignore: return_of_invalid_type_from_catch_error
            .catchError((e) => _showDialog(error));

        return null;
      } catch (e) {}
    }
  }

  // ignore: missing_return
  String validateemail(value) {
    if (value.isEmpty) {
      return "Campo obrigatório *";
    } else if (!(value.contains('@') && value.contains('.com'))) {
      return "Digite um email válido *";
    } else {
      return null;
    }
  }

  String validatepass(value) {
    if (value.isEmpty) {
      return "Este campo não pode estar vazio *";
    } else {
      return null;
    }
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
      if (_obscureText) {
        _viewpass = Icons.visibility_off;
      } else {
        _viewpass = Icons.visibility;
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [],
      ),
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/login_background.png"),
                  fit: BoxFit.cover)),
          child: ListView(physics: NeverScrollableScrollPhysics(), children: <
              Widget>[
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
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 50),
                  child: Container(
                      height: MediaQuery.of(context).size.height / 1.5,
                      padding: EdgeInsets.only(top: 20, right: 10, left: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(35),
                              topRight: Radius.circular(35))),
                      child: Form(
                        key: _formkey,
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
                              TextFormField(
                                validator: validateemail,
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                obscureText: false,
                                style: defaultFont(
                                    16, FontWeight.normal, pgreytextfield),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    prefixIcon:
                                        Icon(Icons.account_circle_sharp),
                                    labelText: 'Email',
                                    labelStyle: defaultFont(
                                        16, FontWeight.normal, pgreytextfield)),
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
                                validator: validatepass,
                                controller: passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: _obscureText,
                                style: defaultFont(
                                    16, FontWeight.normal, pgreytextfield),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    prefixIcon: Icon(Icons.lock_outline),
                                    suffixIcon: IconButton(
                                      onPressed: _toggle,
                                      icon: Icon(_viewpass),
                                    ),
                                    labelText: 'Senha',
                                    labelStyle: defaultFont(
                                        16, FontWeight.normal, pgreytextfield)),
                              ),
                            ),
                            SizedBox(
                              height: padbutton,
                            ),
                            FadeAnimation(
                              2,
                              30.0,
                              0.0,
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: porange,
                                    textStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                    minimumSize: Size(320, 50),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25))),
                                onPressed: () {
                                  validateAndSubmit();
                                },
                                child: Text("Entrar"),
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                FadeAnimation(
                                  2,
                                  30.0,
                                  0.0,
                                  TextButton(
                                    style: TextButton.styleFrom(
                                        primary: Colors.white),
                                    onPressed: () {
                                      Navigator.popAndPushNamed(
                                          context, '/signup');
                                    },
                                    child: Text(
                                      'Cadastrar',
                                      style: defaultFont(
                                          14, FontWeight.bold, porange),
                                    ),
                                  ),
                                ),
                                FadeAnimation(
                                    2,
                                    30.0,
                                    0.0,
                                    TextButton(
                                      style: TextButton.styleFrom(
                                          primary: Colors.white,
                                          minimumSize: Size(30, 0)),
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/reset');
                                      },
                                      child: Text(
                                        "Esqueceu a Senha?",
                                        textAlign: TextAlign.center,
                                        style: defaultFont(14, FontWeight.bold,
                                            pgreytextfield),
                                      ),
                                    ))
                              ],
                            )
                          ],
                        ),
                      )),
                )),
          ])),
    );
  }
}
