import 'package:cloud_firestore/cloud_firestore.dart';

import 'view.dart';

var _firestore = FirebaseFirestore.instance;

class PFUser {
  String email;
  String name;
  String weight;
  String height;
  PFUser(this.email, this.name, this.weight, this.height);

  Map<String, dynamic> toMap() {
    return {"email": email, "nome": name, "peso": weight, "altura": height};
  }
}

addInfo(email) {
  var user = PFUser(email, "", "", "");
  _firestore.collection("usuarios").doc(email).set(user.toMap());
}
