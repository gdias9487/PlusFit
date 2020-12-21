import 'package:flutter/material.dart';
import 'package:plusfit/components/assets.dart';
import 'package:plusfit/components/constants.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  var _viewpass = Icons.visibility_off;
  bool _obscureText = true;

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
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/login_background.png"),
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
                height: 280,
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
                        keyboardType: TextInputType.emailAddress,
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
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _obscureText,
                        style: new TextStyle(color: Colors.black, fontSize: 18),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                            prefixIcon: Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                                onPressed: _toggle, icon: Icon(_viewpass)),
                            labelText: 'Senha',
                            labelStyle: TextStyle(color: pgreytextfield)),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      height: 32,
                      decoration: BoxDecoration(color: Colors.white),
                      child: FlatButton(
                        highlightColor: Colors.white,
                        onPressed: () {},
                        child: Text(
                          "Forgot Password?",
                          textAlign: TextAlign.right,
                          style: TextStyle(color: pgreytextfield),
                        ),
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
                          child: Text("Sign in"),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              height: 32,
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                  ),
                  Text(
                    "Don't have an account ?",
                    textAlign: TextAlign.right,
                    style: TextStyle(color: pyellow),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    width: 80,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Text(
                        "Sing up",
                        style: TextStyle(
                            color: pyellow, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ])),
    );
  }
}
