import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:plusfit/authentication.dart';
import 'package:plusfit/widgets/AlertDialog.dart';
>>>>>>> a2022aa04a764d61725d0c5876ca5ac161c58561
import 'package:plusfit/widgets/TextFormFieldContainer.dart';
import 'package:plusfit/widgets/TextField.dart';
import 'package:plusfit/components/constants.dart';
import 'package:plusfit/src/signUpPage/controller.dart';
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
            .then((value) => Navigator.pushNamed(context, '/exercises'))
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
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/sign_up_background.png"),
                    fit: BoxFit.cover)),
            child: Form(
                key: _formkey,
                child: ListView(children: <Widget>[
                  IconButton(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    alignment: Alignment.topLeft,
                    color: Colors.white,
                    icon: Icon(Icons.arrow_back_ios),
                    splashRadius: 20,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                      height: 110,
                      width: 150,
                      child: Image.asset("assets/Plusfit_logo.png")),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 30),
                    child: Container(
                        height: 422,
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
                              TextFormField(
                                validator: validateemail,
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                obscureText: false,
                                style: new TextStyle(
                                    color: Colors.black, fontSize: 18),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    prefixIcon:
                                        Icon(Icons.account_circle_sharp),
                                    labelText: 'Email',
                                    labelStyle:
                                        TextStyle(color: pgreytextfield)),
                              ),
                              SizedBox(
                                height: paddefault,
                              ),
                              TextFormField(
                                validator: validatepass,
                                controller: passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: _obscureText,
                                style: new TextStyle(
                                    color: Colors.black, fontSize: 18),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    prefixIcon: Icon(Icons.lock_outline),
                                    suffixIcon: IconButton(
                                      onPressed: _toggle,
                                      icon: Icon(_viewpass),
                                    ),
<<<<<<< HEAD
                                    onPressed: () {
                                      _controller.singUp(
                                        emailController.text,
                                        passwordController.text,
                                        passwordController1,
                                      );
                                    }),
                              ],
=======
                                    labelText: 'Senha',
                                    labelStyle:
                                        TextStyle(color: pgreytextfield)),
                              ),
                              SizedBox(
                                height: paddefault,
                              ),
                              TextFormField(
                                validator: validatepass,
                                controller: passwordController1,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: _obscureText1,
                                style: new TextStyle(
                                    color: Colors.black, fontSize: 18),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    prefixIcon: Icon(Icons.lock_outline),
                                    suffixIcon: IconButton(
                                      onPressed: _toggle1,
                                      icon: Icon(_viewpass1),
                                    ),
                                    labelText: 'Confirmar Senha',
                                    labelStyle:
                                        TextStyle(color: pgreytextfield)),
                              ),
                              SizedBox(
                                height: padbutton,
                              ),
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    ElevatedButton(
                                        child: Text("Cadastrar"),
                                        style: ElevatedButton.styleFrom(
                                          primary: porange,
                                          textStyle: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                          minimumSize: Size(320, 50),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                        ),
                                        onPressed: () {
                                          validateAndSubmit();
                                        }),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 65,
                              ),
                            ])),
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
                              Navigator.popAndPushNamed(context, '/login');
                            },
                            child: Text(
                              "Entrar",
                              style: TextStyle(
                                  color: pyellow, fontWeight: FontWeight.bold),
>>>>>>> a2022aa04a764d61725d0c5876ca5ac161c58561
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]))));
  }
}
