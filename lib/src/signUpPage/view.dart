import 'package:flutter/material.dart';
import 'package:plusfit/widgets/TextFormFieldContainer.dart';
import 'package:plusfit/widgets/TextField.dart';
import 'package:plusfit/components/constants.dart';
import 'package:plusfit/src/signUpPage/controller.dart';
import '../../components/constants.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordController1 = TextEditingController();

  Controller _controller = Controller();

  var _viewPass = Icons.visibility_off;
  var _viewPass1 = Icons.visibility_off;
  bool _obscureText = true;
  bool _obscureText1 = true;

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/sign_up_background.png"),
                    fit: BoxFit.cover)),
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
                    height: 380,
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
                          DefaultTextField(
                            controler: emailController,
                            obscureText: false,
                            text: "Email",
                            prefixicon: Icons.account_circle_sharp,
                          ),
                          SizedBox(
                            height: paddefault,
                          ),
                          TextFieldContainer(
                            child: TextField(
                              controller: passwordController,
                              obscureText: _obscureText,
                              style: new TextStyle(
                                  color: Colors.black, fontSize: 18),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(35)),
                                  prefixIcon: Icon(Icons.lock_outline),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _viewPass =
                                            _controller.toggle(_obscureText);
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                    icon: Icon(_viewPass),
                                  ),
                                  labelText: 'Senha',
                                  labelStyle: TextStyle(color: pgreytextfield)),
                            ),
                          ),
                          SizedBox(
                            height: paddefault,
                          ),
                          TextFieldContainer(
                            child: TextField(
                              obscureText: _obscureText1,
                              style: new TextStyle(
                                  color: Colors.black, fontSize: 18),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  prefixIcon: Icon(Icons.lock_outline),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _viewPass1 =
                                            _controller.toggle(_obscureText1);
                                        _obscureText1 = !_obscureText1;
                                      });
                                    },
                                    icon: Icon(_viewPass1),
                                  ),
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
                                      _controller.singIn(emailController.text,
                                          passwordController.text);
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
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ])));
  }
}
