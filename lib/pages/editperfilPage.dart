import 'package:flutter/material.dart';
import 'package:plusfit/widgets/Buttons.dart';


class EditPage extends StatefulWidget {
  EditPage({Key key, this.title}) : super(key: key);

  

  final String title;

  @override
  _MyEditPageState createState() => _MyEditPageState();
}

class _MyEditPageState extends State<EditPage> {
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
            elevation: 0,
            title: Text("Editar Perfil",style: TextStyle(fontSize: 21),),
            backgroundColor: Colors.black,
            leading: IconButton(icon: Icon(Icons.arrow_back_ios),
            onPressed: (){
              Navigator.pop(context);
            },
            ),
          ),
      body: Container(
        padding: EdgeInsets.only(left:16, top:25, right: 16),
        child: ListView(
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      border: Border.all(width:4, color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius:2, blurRadius: 10,
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(0,10)
                        )
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage("assets/homem.png")),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      
                      height: 40,
                      width: 45,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 4, color: Theme.of(context).scaffoldBackgroundColor),
                        color: Colors.red,
                      ),
                      child: IconButton(icon: Icon(Icons.edit),color: Colors.white, 
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: ((builder) => Bordaedit()),
                        );
                      },
                      ),
                  ),),
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            TextField(
             keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                filled: true,
                fillColor:  Color(0xFFF2F2F2),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)
                ),
                hintText: "Nome Completo",
                hintStyle: TextStyle(fontSize: 17,color: Colors.black87),
                 icon: Icon(
                      Icons.portrait,
                      color: Colors.white,
                      size: 25.0,
                    ),
              ),
            ),
            SizedBox(height:35),
             TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                filled: true,
                fillColor:  Color(0xFFF2F2F2),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)
                ),
                hintText: "Novo Email",
                hintStyle: TextStyle(fontSize: 17,color: Colors.black87),
                 icon: Icon(
                      Icons.email,
                      color: Colors.white,
                      size: 25.0,
                    ),
              ),
            ),
            SizedBox(height:35),
             TextField(
               keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                filled: true,
                fillColor:  Color(0xFFF2F2F2),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)
                ),
                hintText: "Nova Senha",
                hintStyle: TextStyle(fontSize: 17,color: Colors.black87),
                 icon: Icon(
                      Icons.vpn_key,
                      color: Colors.white,
                      size: 25.0,
                    ),
              ),
            ),
            SizedBox(height:35),
             TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                filled: true,
                fillColor:  Color(0xFFF2F2F2),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)
                ),
                hintText: "Nova Altura",
                hintStyle: TextStyle(fontSize: 17,color: Colors.black87),
                 icon: Icon(
                      Icons.accessibility,
                      color: Colors.white,
                      size: 25.0,
                    ),
              ),
            ),
            SizedBox(height:35),
             TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                filled: true,
                fillColor:  Color(0xFFF2F2F2),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)
                ),
                hintText: "Novo Peso",
                hintStyle: TextStyle(fontSize: 17,color: Colors.black87),
                 icon: Icon(
                      Icons.height,
                      color: Colors.white,
                      size: 25.0,
                    ),
              ),
            ),
            SizedBox(height: 45),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              RaisedButton(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal:50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)
                ),
                onPressed: () {},
                child: Text("CANCELAR", style: 
                TextStyle(fontSize: 14,
                letterSpacing: 2.2,
                color: Colors.red),
                ), 
              ),
              RaisedButton(
                onPressed: () {},
                color: Colors.red,
                padding: EdgeInsets.symmetric(horizontal:50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text("SALVAR", style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 2.2,
                  color: Colors.white
                ),
                ),
                ),
            ],)
          ],
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/backedit.png"), fit: BoxFit.cover
          ),
        ),
      ),
    );
     
  }
}