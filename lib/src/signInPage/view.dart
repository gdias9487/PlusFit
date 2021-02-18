import 'package:flutter/material.dart';
import 'package:plusfit/components/constants.dart';
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
  // ignore: override_on_non_overriding_member
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
      body: Container(
          color: Colors.black,
          child: ListView(children: <Widget>[
            FadeAnimation(
                0,
                1000,
                30.0,
                0.0,
                SizedBox(
                    height: 250,
                    child: Image.asset("assets/Plusfit_logo.png"))),
            FadeAnimation(
                0,
                1000,
                800.0,
                0.0,
                Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: Container(
                      height: (MediaQuery.of(context).size.height / 2) + 50,
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
                            Padding(
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: TextFormField(
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
                            Padding(
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: TextFormField(
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
                            Padding(
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: ElevatedButton(
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
                                TextButton(
                                  style: TextButton.styleFrom(
                                      primary: Colors.white,
                                      minimumSize: Size(30, 0)),
                                  onPressed: () {
                                    Navigator.popAndPushNamed(
                                        context, '/reset');
                                  },
                                  child: Text(
                                    "Esqueceu a Senha?",
                                    textAlign: TextAlign.center,
                                    style: defaultFont(
                                        14, FontWeight.bold, pgreytextfield),
                                  ),
                                )
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
