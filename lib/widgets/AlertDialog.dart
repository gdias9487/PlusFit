import 'package:flutter/material.dart';
import 'package:plusfit/components/constants.dart';

class Alert_Box extends StatelessWidget {
  final Key key;
  final buttons;
  final text;
  final title;
  final action;

  const Alert_Box(
      {this.buttons,
      this.text,
      this.title = " Ocorreu um erro ",
      this.key,
      this.action});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: new Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        content: new Text(text),
        actions: buttons,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))));
  }
}

Widget exerciseInfo(context, nome, series, repeticoes) {
  return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.white),
            color: Colors.grey[600],
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35))),
        height: 500,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 0,
        ),
        child: Column(
          children: <Widget>[
            Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  minWidth: 1,
                  child: Icon(Icons.arrow_back_ios),
                  onPressed: () {},
                )),
            SizedBox(
              height: 30,
            ),
            Text(nome, style: defaultFont(20, FontWeight.bold, Colors.black)),
            SizedBox(height: 40),
            Center(
                child: Container(
              height: 200,
              decoration: BoxDecoration(
                  //color: Colors.red[900],
                  image: DecorationImage(
                      image: AssetImage("assets/superior/gifs/flexao.gif"),
                      fit: BoxFit.fitWidth)),
            )),
            Text(
              repeticoes.toString(),
              style: defaultFont(20, FontWeight.normal, Colors.black),
            ),
            Spacer(),
            Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                    style: TextButton.styleFrom(backgroundColor: porange),
                    onPressed: () {},
                    child: Text(
                      "Próximo",
                      style: defaultFont(16, FontWeight.bold, Colors.white),
                    ))),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ));
}
