import 'package:flutter/material.dart';
import 'package:plusfit/components/assets.dart';

void main() {
  runApp(PFApp());
}

class PFApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PlusFit v1.0',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: 'PlusFit'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [0.5, 0.9],
                  colors: [Colors.black, Color(0xFF26020F)])),
          child: ListView(children: <Widget>[
            SizedBox(
              height: 30,
            ),
            SizedBox(
                height: 180,
                width: 180,
                child: Image.asset("assets/Plusfit_logo.png")),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Container(
                height: 310,
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
                      height: 5,
                    ),
                    TextFieldContainer(
                      child: TextField(
                        style: new TextStyle(color: Colors.black, fontSize: 18),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                            fillColor: Colors.blue,
                            prefixIcon: Icon(Icons.account_circle),
                            labelText: 'E-mail',
                            labelStyle: TextStyle(color: Colors.black)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFieldContainer(
                      child: TextField(
                        obscureText: true,
                        style: new TextStyle(color: Colors.black, fontSize: 18),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                            prefixIcon: Icon(Icons.lock_outline),
                            suffixIcon: Icon(Icons.visibility_off),
                            labelText: 'Senha',
                            labelStyle: TextStyle(color: Colors.black)),
                      ),
                    ),
                    Container(
                      height: 32,
                      decoration: BoxDecoration(color: Colors.white),
                      child: TextButton(
                        onPressed: () {},
                        child: Text("Forgot Password?"),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        child: Column(
                      children: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              textStyle: TextStyle(fontSize: 16),
                              minimumSize: Size(150, 45),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          onPressed: () {},
                          child: Text("Login"),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ])),
    );
  }
}
