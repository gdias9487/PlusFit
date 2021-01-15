import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String> singIn({String email, String password}) async{
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> singUp({String email, String password}) async{
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return "Signed Up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

}