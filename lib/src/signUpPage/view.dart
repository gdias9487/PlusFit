import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plusfit/authentication.dart';
import 'package:plusfit/src/signUpPage/models.dart';
import 'package:plusfit/widgets/AlertDialog.dart';
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
  final _firebase = FirebaseAuth.instance;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  Controller _controller = Controller();

  var confirmp;
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
                email: _emailController.text.trim(),
                password: _passwordController.text.trim())
            .then((value) {
          addInfo(_firebase.currentUser.email);
          Navigator.popAndPushNamed(context, '/login');
        })
            // ignore: return_of_invalid_type_from_catch_error
            .catchError((e) => _showDialog(error));

        return null;
      } catch (e) {}
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
            color: Colors.black,
            child: Form(
                key: _formkey,
                child: ListView(children: <Widget>[
                  FadeAnimation(
                      0,
                      800,
                      30.0,
                      0.0,
                      Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: SizedBox(
                              height: 250,
                              child: Image.asset("assets/Plusfit_logo.png")))),
                  FadeAnimation(
                      0,
                      900,
                      800.0,
                      0.0,
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Container(
                            height:
                                (MediaQuery.of(context).size.height / 2) + 25,
                            padding:
                                EdgeInsets.only(top: 10, right: 10, left: 10),
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
                                  TextFormField(
                                    validator: validateemail,
                                    controller: _emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    obscureText: false,
                                    style: defaultFont(
                                        16, FontWeight.normal, Colors.black),
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        prefixIcon:
                                            Icon(Icons.account_circle_sharp),
                                        labelText: 'Email',
                                        labelStyle: defaultFont(16,
                                            FontWeight.normal, pgreytextfield)),
                                  ),
                                  SizedBox(
                                    height: paddefault,
                                  ),
                                  TextFormField(
                                    validator: pass,
                                    controller: _passwordController,
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
                                        labelStyle: defaultFont(16,
                                            FontWeight.normal, pgreytextfield)),
                                  ),
                                  SizedBox(
                                    height: paddefault,
                                  ),
                                  TextFormField(
                                    validator: confirmpass,
                                    controller: _confirmPasswordController,
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: _obscureText1,
                                    style: defaultFont(
                                        16, FontWeight.normal, pgreytextfield),
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
                                        labelStyle: defaultFont(16,
                                            FontWeight.normal, pgreytextfield)),
                                  ),
                                  SizedBox(
                                    height: padbutton,
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: ElevatedButton(
                                        child: Text("Cadastrar"),
                                        style: ElevatedButton.styleFrom(
                                          primary: porange,
                                          textStyle: defaultFont(20,
                                              FontWeight.bold, Colors.black),
                                          minimumSize: Size(320, 50),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                        ),
                                        onPressed: () {
                                          validateAndSubmit();
                                        }),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.popAndPushNamed(
                                            context, '/login');
                                      },
                                      child: Text(
                                        'Entrar',
                                        style: defaultFont(
                                            16, FontWeight.bold, porange),
                                      ))
                                ])),
                      )),
                ]))));
  }
}
