import 'package:cloud_firestore/cloud_firestore.dart';

import 'view.dart';

var _firestore = FirebaseFirestore.instance;

class PFUser {
  String email;
  String name;
  String weight;
  String height;
  String image;
  PFUser(this.email, this.name, this.weight, this.height, this.image);

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "nome": name,
      "peso": weight,
      "altura": height,
      "image": image
    };
  }
}

addInfo(email) {
  var user = PFUser(email, "", "", "", "defaultprofilephoto.jpg");
  _firestore.collection("usuarios").doc(email).set(user.toMap());
}
