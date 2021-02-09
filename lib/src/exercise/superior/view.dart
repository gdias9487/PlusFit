import 'package:flutter/material.dart';
import 'package:plusfit/src/exercise/superior/exerciseList/view.dart';
import 'package:plusfit/widgets/TrainingContainer.dart';

class SuperiorPage extends StatefulWidget {
  SuperiorPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SuperiorPageState createState() => _SuperiorPageState();
}

class _SuperiorPageState extends State<SuperiorPage> {
  double _slideValue = 0;
  double _slideValue1 = 0;

  String _cursor = "minutos";

  @override
  Widget build(BuildContext context) {
    final ScrollController cont = ScrollController();
    void scroll() {
      cont.animateTo(0,
          duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Treinos Superiores',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle_sharp),
            color: Colors.white,
            splashRadius: 20,
            iconSize: 35,
            onPressed: () {
              Navigator.pushNamed(context, '/perfil');
            },
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          splashRadius: 20,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/sign_up_background.png"),
                  fit: BoxFit.cover)),
          child: ListView(controller: cont, children: <Widget>[
            SizedBox(
              height: 20,
            ),
            SizedBox(
                height: 100,
                width: 100,
                child: Image.asset("assets/Plusfit_logo.png")),
            SizedBox(
              height: 30,
            ),
            IconButton(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              alignment: Alignment.center,
              color: Colors.white,
              icon: Icon(Icons.filter_alt),
              iconSize: 35,
              splashRadius: 20,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Center(
              child: Text(
                "Tempo disponível em minutos:",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            Slider(
              onChanged: (t) {
                setState(() {
                  _slideValue = t;
                });
              },
              value: _slideValue,
              min: 0,
              label: "$_slideValue minutos",
              max: 50,
              divisions: 10,
              inactiveColor: Colors.grey,
              activeColor: Colors.red,
            ),
            Center(
              child: Text(
                "Tempo dos intervalos:",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            Slider(
              onChanged: (t) {
                setState(() {
                  _slideValue1 = t;
                });
              },
              value: _slideValue1,
              min: 0,
              label: " intervalo: $_slideValue1 $_cursor",
              max: 5,
              divisions: 5,
              inactiveColor: Colors.grey,
              activeColor: Colors.red,
            ),
            TrainingContainer(
                width: 1,
                height: 150,
                horizontal: 40,
                vertical: 10,
                text: 'Básico',
                action: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Superior(nivel: "basico")));
                }),
            TrainingContainer(
                width: 1,
                height: 150,
                horizontal: 40,
                vertical: 10,
                text: 'Intermediário',
                action: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Superior(nivel: "intermediario")));
                }),
            TrainingContainer(
                width: 1,
                height: 150,
                horizontal: 40,
                vertical: 10,
                text: 'Avançado',
                action: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Superior(nivel: "avancado")));
                }),
            SizedBox(
              height: 50,
            ),
          ])),
    );
  }
}
