import 'package:flutter/material.dart';

class ConfigPage extends StatefulWidget {
  ConfigPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyConfigPageState createState() => _MyConfigPageState();
}

class _MyConfigPageState extends State<ConfigPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Configurações",
          style: TextStyle(fontSize: 21),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/backedit.png"), fit: BoxFit.cover),
          ),
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              Text(
                "Favoritos",
                style: TextStyle(
                    color: Colors.white30,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.assignment_turned_in_sharp,
                            color: Colors.black),
                        title: Text(
                          "Treinos Favoritos",
                          style: TextStyle(fontSize: 19.0),
                        ),
                        onTap: () {},
                      ),
                      Divider(height: 10.0, color: Colors.grey),
                      ListTile(
                        leading: Icon(Icons.assignment_turned_in_sharp,
                            color: Colors.black),
                        title: Text(
                          "Pontos",
                          style: TextStyle(fontSize: 19.0),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Text(
                "Privacidade",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white30),
              ),
              SizedBox(height: 10.0),
              Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.assignment_turned_in_sharp,
                            color: Colors.black),
                        title: Text(
                          "Excluir Conta",
                          style: TextStyle(fontSize: 19.0),
                        ),
                        onTap: () {},
                      ),
                      Divider(height: 10.0, color: Colors.grey),
                      ListTile(
                        leading: Icon(Icons.assignment_turned_in_sharp,
                            color: Colors.black),
                        title: Text(
                          "Notificações",
                          style: TextStyle(fontSize: 19.0),
                        ),
                        onTap: () {},
                      ),
                      Divider(height: 10.0, color: Colors.grey),
                      ListTile(
                        leading: Icon(Icons.assignment_turned_in_sharp,
                            color: Colors.black),
                        title: Text(
                          "Configar Perfil",
                          style: TextStyle(fontSize: 19.0),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Text(
                "Segurança",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white30),
              ),
              SizedBox(height: 10),
              Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.assignment_turned_in_sharp,
                            color: Colors.black),
                        title: Text(
                          "Alterar Senha",
                          style: TextStyle(fontSize: 19.0),
                        ),
                        onTap: () {},
                      ),
                      Divider(height: 10.0, color: Colors.grey),
                      ListTile(
                        leading: Icon(Icons.assignment_turned_in_sharp,
                            color: Colors.black),
                        title: Text(
                          "Desconectar",
                          style: TextStyle(fontSize: 19.0),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 72)
            ],
          ),
        ),
      ),
    );
  }
}
