// import 'package:flutter/material.dart';
// import 'package:plusfit/components/constants.dart';
// import 'package:plusfit/src/profilePage/models.dart';
// import 'package:plusfit/widgets/animations.dart';

// class Sla extends StatefulWidget {
//   @override
//   _SlaState createState() => _SlaState();
// }

// class _SlaState extends State<Sla> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text("Perfil")),
//         elevation: 0,
//         backgroundColor: Colors.black,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         actions: [],
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage("assets/backperfil.png"), fit: BoxFit.cover),
//         ),
//         padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               FadeAnimation(
//                   1,
//                   500,
//                   -40.0,
//                   0.0,
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       perfilImagem(),
//                       SizedBox(width: 20.0),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           GetUserName(getEmail(_firebaseAuth.currentUser)),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           GetUserEmail(getEmail(_firebaseAuth.currentUser)),
//                           Row(
//                             children: <Widget>[
//                               DefaultElevatedButton(
//                                 color: porange,
//                                 fontSize: 12,
//                                 height: 60,
//                                 radius: 25,
//                                 width: 30,
//                                 text: 'Desconectar',
//                                 action: () {
//                                   _showDialog();
//                                 },
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     ],
//                   )),
//               SizedBox(height: 20.0),
//               FadeAnimation(
//                   1,
//                   500,
//                   30.0,
//                   0.0,
//                   Text(
//                     "Conta",
//                     style: defaultFont(20, FontWeight.bold, Colors.white),
//                   )),
//               SizedBox(height: 10.0),
//               FadeAnimation(
//                   1,
//                   500,
//                   30.0,
//                   0.0,
//                   Card(
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 16.0),
//                       child: Column(
//                         children: <Widget>[
//                           ExpansionTile(
//                             onExpansionChanged: (value) {
//                               Icon(Icons.arrow_drop_down);
//                             },
//                             children: showInfo(),
//                             trailing: Icon(
//                               Icons.arrow_forward_ios,
//                               color: Colors.black,
//                               size: 16,
//                             ),
//                             leading: Icon(Icons.person, color: Colors.black),
//                             title: Text(
//                               "Informações pessoais",
//                               style: defaultFont(
//                                   16, FontWeight.normal, Colors.black),
//                             ),
//                           ),
//                           Divider(height: 10.0, color: Colors.grey),
//                           ExpansionTile(
//                             trailing: Icon(
//                               Icons.arrow_forward_ios,
//                               color: Colors.black,
//                               size: 16,
//                             ),
//                             leading: Icon(Icons.vpn_key, color: Colors.black),
//                             title: Text(
//                               "Alterar senha",
//                               style: defaultFont(
//                                   16, FontWeight.normal, Colors.black),
//                             ),
//                             children: editPass,
//                           ),
//                           Divider(height: 10.0, color: Colors.grey),
//                           ListTile(
//                             trailing: Icon(
//                               Icons.arrow_forward_ios,
//                               color: Colors.black,
//                               size: 16,
//                             ),
//                             leading: Icon(Icons.assignment_turned_in_sharp,
//                                 color: Colors.black),
//                             title: Text(
//                               "Treinos",
//                               style: defaultFont(
//                                   16, FontWeight.normal, Colors.black),
//                             ),
//                             onTap: () {},
//                           ),
//                           Divider(height: 10.0, color: Colors.grey),
//                           ListTile(
//                             leading:
//                                 Icon(Icons.block_outlined, color: Colors.red),
//                             title: Text(
//                               "Desativar conta",
//                               style: defaultFont(
//                                   16, FontWeight.normal, Colors.red),
//                             ),
//                             onTap: () {},
//                           ),
//                         ],
//                       ),
//                     ),
//                   )),
//               SizedBox(height: 10.0),
//               FadeAnimation(
//                   1,
//                   500,
//                   30.0,
//                   0.0,
//                   Text(
//                     "Configurações",
//                     style: TextStyle(
//                         fontSize: 20.0,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white),
//                   )),
//               SizedBox(height: 10.0),
//               FadeAnimation(
//                   1,
//                   500,
//                   30.0,
//                   0.0,
//                   Card(
//                     elevation: 3.0,
//                     child: Padding(
//                       padding: EdgeInsets.all(14.0),
//                       child: Column(
//                         children: <Widget>[
//                           ListTile(
//                               onTap: () {
//                                 Switch(
//                                   value: true,
//                                   onChanged: (bool value) {},
//                                 );
//                               },
//                               leading: Icon(Icons.notifications,
//                                   color: Colors.black),
//                               title: Text(
//                                 "Notificações",
//                                 style: defaultFont(
//                                     16, FontWeight.normal, Colors.black),
//                               )),
//                           Divider(height: 10.0, color: Colors.grey),
//                           ListTile(
//                             leading:
//                                 Icon(Icons.headset_mic, color: Colors.black),
//                             title: Text(
//                               "Suporte",
//                               style: defaultFont(
//                                   16, FontWeight.normal, Colors.black),
//                             ),
//                             onTap: () {},
//                           ),
//                         ],
//                       ),
//                     ),
//                   )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
