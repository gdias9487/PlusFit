import 'package:flutter/material.dart';
import 'package:plusfit/authentication.dart';
import 'package:plusfit/widgets/AlertDialog.dart';
import 'package:plusfit/widgets/TextFormFieldContainer.dart';
import 'package:plusfit/widgets/TextField.dart';
import 'package:plusfit/components/constants.dart';
import 'package:plusfit/src/signUpPage/controller.dart';
import 'package:plusfit/widgets/animations.dart';
import '../../components/constants.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordController1 = TextEditingController();

  Controller _controller = Controller();

  var _viewpass = Icons.visibility_off;
  var _viewpass1 = Icons.visibility_off;
  bool _obscureText = true;
  bool _obscureText1 = true;

  void _showDialog(text) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Alert_Box(
            text: text,
          );
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
            .signUp(
                email: emailController.text.trim(),
                password: passwordController.text.trim())
            .then((value) => Navigator.pop(context))
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
    } else
      return null;
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

  void _toggle1() {
    setState(() {
      _obscureText1 = !_obscureText1;
      if (_obscureText1) {
        _viewpass1 = Icons.visibility_off;
      } else {
        _viewpass1 = Icons.visibility;
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/login_background.png"),
                    fit: BoxFit.cover)),
            child: Form(
                key: _formkey,
                child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
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
                                height:
                                    MediaQuery.of(context).size.height / 1.5,
                                padding: EdgeInsets.only(
                                    top: 10, right: 10, left: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(35),
                                        topRight: Radius.circular(35))),
                                child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
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
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            obscureText: false,
                                            style: defaultFont(
                                                15,
                                                FontWeight.normal,
                                                Colors.black),
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                prefixIcon: Icon(
                                                    Icons.account_circle_sharp),
                                                labelText: 'Email',
                                                labelStyle: defaultFont(
                                                    15,
                                                    FontWeight.normal,
                                                    pgreytextfield)),
                                          )),
                                      SizedBox(
                                        height: paddefault,
                                      ),
                                      FadeAnimation(
                                          2,
                                          30.0,
                                          0.0,
                                          TextFormField(
                                            validator: validatepass,
                                            controller: passwordController,
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            obscureText: _obscureText,
                                            style: defaultFont(
                                                15,
                                                FontWeight.normal,
                                                pgreytextfield),
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                prefixIcon:
                                                    Icon(Icons.lock_outline),
                                                suffixIcon: IconButton(
                                                  onPressed: _toggle,
                                                  icon: Icon(_viewpass),
                                                ),
                                                labelText: 'Senha',
                                                labelStyle: defaultFont(
                                                    15,
                                                    FontWeight.normal,
                                                    pgreytextfield)),
                                          )),
                                      SizedBox(
                                        height: paddefault,
                                      ),
                                      FadeAnimation(
                                          2,
                                          30.0,
                                          0.0,
                                          TextFormField(
                                            validator: validatepass,
                                            controller: passwordController1,
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            obscureText: _obscureText1,
                                            style: defaultFont(
                                                15,
                                                FontWeight.normal,
                                                pgreytextfield),
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                prefixIcon:
                                                    Icon(Icons.lock_outline),
                                                suffixIcon: IconButton(
                                                  onPressed: _toggle1,
                                                  icon: Icon(_viewpass1),
                                                ),
                                                labelText: 'Confirmar Senha',
                                                labelStyle: defaultFont(
                                                    15,
                                                    FontWeight.normal,
                                                    pgreytextfield)),
                                          )),
                                      SizedBox(
                                        height: padbutton,
                                      ),
                                      FadeAnimation(
                                          2,
                                          30.0,
                                          0.0,
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: ElevatedButton(
                                                child: Text("Cadastrar"),
                                                style: ElevatedButton.styleFrom(
                                                  primary: porange,
                                                  textStyle: defaultFont(
                                                      20,
                                                      FontWeight.bold,
                                                      Colors.black),
                                                  minimumSize: Size(320, 50),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25)),
                                                ),
                                                onPressed: () {
                                                  validateAndSubmit();
                                                }),
                                          )),
                                      FadeAnimation(
                                          2,
                                          30.0,
                                          0.0,
                                          TextButton(
                                              onPressed: () {
                                                Navigator.popAndPushNamed(
                                                    context, '/login');
                                              },
                                              child: Text(
                                                'Entrar',
                                                style: defaultFont(16,
                                                    FontWeight.bold, porange),
                                              )))
                                    ])),
                          )),
                    ]))));
  }
}
