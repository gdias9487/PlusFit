import 'package:flutter/material.dart';
import 'package:plusfit/components/constants.dart';

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
  bool validateAndSave() {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      return true;
    } else {
      return false;
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
              height: 30,
            ),
            SizedBox(
                height: 150,
                width: 150,
                child: Image.asset("assets/Plusfit_logo.png")),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35, vertical: 30),
              child: Container(
                  height: 400,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
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
                        TextFormField(
                          validator: validateemail,
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          style:
                              new TextStyle(color: Colors.black, fontSize: 18),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              prefixIcon: Icon(Icons.account_circle_sharp),
                              labelText: 'Email',
                              labelStyle: TextStyle(color: pgreytextfield)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: validatepass,
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: _obscureText,
                          style:
                              new TextStyle(color: Colors.black, fontSize: 18),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              prefixIcon: Icon(Icons.lock_outline),
                              suffixIcon: IconButton(
                                onPressed: _toggle,
                                icon: Icon(_viewpass),
                              ),
                              labelText: 'Senha',
                              labelStyle: TextStyle(color: pgreytextfield)),
                        ),
                        SizedBox(
                          height: padbutton,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: porange,
                              textStyle: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              minimumSize: Size(320, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25))),
                          onPressed: () {
                            Navigator.pushNamed(context, '/exercises');
                          },
                          child: Text("Entrar"),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          height: 32,
                          decoration: BoxDecoration(color: Colors.white),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/reset');
                            },
                            child: Text(
                              "Esqueceu a Senha?",
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
                          children: <Widget>[],
                        ))
                      ],
                    ),
                  )),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              height: 32,
              child: Row(
                children: [
                  SizedBox(
                    width: 75,
                  ),
                  Text(
                    "Não possui uma conta?",
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
                        "Cadastrar",
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
