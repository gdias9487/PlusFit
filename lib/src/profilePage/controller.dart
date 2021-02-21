// Container(
//                                       child: Column(children: <Widget>[
//                                     TextFormField(
//                                       controller: nome,
//                                       keyboardType: TextInputType.name,
//                                       obscureText: false,
//                                       style: defaultFont(14, FontWeight.normal,
//                                           pgreytextfield),
//                                       decoration: InputDecoration(
//                                           border: OutlineInputBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(30)),
//                                           prefixIcon:
//                                               Icon(Icons.account_circle_sharp),
//                                           labelText: 'Nome',
//                                           labelStyle: defaultFont(
//                                               16,
//                                               FontWeight.normal,
//                                               pgreytextfield)),
//                                     ),
//                                     SizedBox(
//                                       height: 10,
//                                     ),
//                                     Row(children: <Widget>[
//                                       Flexible(
//                                           child: TextFormField(
//                                         controller: peso,
//                                         keyboardType: TextInputType.number,
//                                         obscureText: false,
//                                         style: defaultFont(14,
//                                             FontWeight.normal, pgreytextfield),
//                                         decoration: InputDecoration(
//                                             border: OutlineInputBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(30)),
//                                             prefixIcon: Icon(
//                                                 Icons.account_circle_sharp),
//                                             labelText: 'Peso',
//                                             labelStyle: defaultFont(
//                                                 16,
//                                                 FontWeight.normal,
//                                                 pgreytextfield)),
//                                       )),
//                                       SizedBox(
//                                         width: 5,
//                                       ),
//                                       Flexible(
//                                           child: TextFormField(
//                                         controller: altura,
//                                         keyboardType: TextInputType.number,
//                                         obscureText: false,
//                                         style: defaultFont(14,
//                                             FontWeight.normal, pgreytextfield),
//                                         decoration: InputDecoration(
//                                             border: OutlineInputBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(30)),
//                                             prefixIcon: Icon(
//                                                 Icons.account_circle_sharp),
//                                             labelText: 'Altura',
//                                             labelStyle: defaultFont(
//                                                 16,
//                                                 FontWeight.normal,
//                                                 pgreytextfield)),
//                                       ))
//                                     ]),
//                                     SizedBox(
//                                       height: 10,
//                                     ),
//                                     Row(
//                                       children: [
//                                         TextButton(
//                                             style: TextButton.styleFrom(
//                                                 minimumSize: Size(100, 35),
//                                                 backgroundColor: porange,
//                                                 shape: RoundedRectangleBorder(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             35))),
//                                             onPressed: () {
//                                               setState(() {});
//                                             },
//                                             child: Text(
//                                               "Cancelar",
//                                               style: defaultFont(
//                                                   14,
//                                                   FontWeight.bold,
//                                                   Colors.white),
//                                             )),
//                                         TextButton(
//                                             style: TextButton.styleFrom(
//                                                 minimumSize: Size(100, 35),
//                                                 backgroundColor: porange,
//                                                 shape: RoundedRectangleBorder(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             35))),
//                                             onPressed: () {
//                                               setInfo(user.email, nome, peso,
//                                                   altura);
//                                               setState(() {});
//                                             },
//                                             child: Text(
//                                               "Salvar",
//                                               style: defaultFont(
//                                                   14,
//                                                   FontWeight.bold,
//                                                   Colors.white),
//                                             )),
//                                       ],
//                                     )
//                                   ]))
