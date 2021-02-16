import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

String error;
getEmail(user) {
  try {
    return user.email;
  } catch (e) {
    return 'erro';
  }
}

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String> singIn({String email, String password}) async {
    try {
      // ignore: unused_local_variable
      final user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Logged in";
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "ERROR_EMAIL_ALREADY_IN_USE":
        case "account-exists-with-different-credential":
        case "email-already-in-use":
          error = "Este e-mail já cadastrado.";
          break;
        case "ERROR_WRONG_PASSWORD":
        case "wrong-password":
          error = "Combinação de e-mail/senha incorreta.";

          break;
        case "ERROR_USER_NOT_FOUND":
        case "user-not-found":
          error = "Nenhum usuário foi encontrado com este endereço de e-mail.";

          break;
        case "ERROR_USER_DISABLED":
        case "user-disabled":
          error = "Usuário desativado.";

          break;
        case "ERROR_TOO_MANY_REQUESTS":
        case "operation-not-allowed":
          error =
              "Foram realizadas muitas requisições para acessar esta conta.";

          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
        case "operation-not-allowed":
          error = "Erro de servidor, tente novamente mais tarde.";

          break;
        case "ERROR_INVALID_EMAIL":
        case "invalid-email":
          error = "E-mail inválido.";

          break;
        default:
          error = "O login falhou, tente novamente.";

          break;
      }
    }
    if (error != null) {
      return Future.error(error);
    } else {
      return null;
    }
  }

  Future<String> signUp({String email, String password}) async {
    try {
      // ignore: unused_local_variable
      final user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Cadastrado";
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "ERROR_EMAIL_ALREADY_IN_USE":
        case "account-exists-with-different-credential":
        case "email-already-in-use":
          error = "Este e-mail já cadastrado.";
          break;
        case "ERROR_WRONG_PASSWORD":
        case "wrong-password":
          error = "Combinação de e-mail/senha incorreta.";
          break;
        case "ERROR_USER_NOT_FOUND":
        case "user-not-found":
          error = "Nenhum usuário foi encontrado com este endereço de e-mail.";
          break;
        case "ERROR_USER_DISABLED":
        case "user-disabled":
          error = "Usuário desativado.";
          break;
        case "ERROR_TOO_MANY_REQUESTS":
        case "operation-not-allowed":
          error =
              "Foram realizadas muitas requisições para acessar esta conta.";
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
        case "operation-not-allowed":
          error = "Erro de servidor, tente novamente mais tarde.";
          break;
        case "ERROR_INVALID_EMAIL":
        case "invalid-email":
          error = "E-mail inválido.";
          break;
        default:
          error = "O login falhou, tente novamente.";
          break;
      }
    }
    if (error != null) {
      return Future.error(error);
    } else {
      return null;
    }
  }

  Future<String> resetPassword(String email) async {
    try {
      final user = await _firebaseAuth.sendPasswordResetEmail(email: email);
      return "E-mail enviado";
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "ERROR_EMAIL_ALREADY_IN_USE":
        case "account-exists-with-different-credential":
        case "email-already-in-use":
          error = "Este e-mail já cadastrado.";
          break;
        case "ERROR_WRONG_PASSWORD":
        case "wrong-password":
          error = "Combinação de e-mail/senha incorreta.";
          break;
        case "ERROR_USER_NOT_FOUND":
        case "user-not-found":
          error = "Nenhum usuário foi encontrado com este endereço de e-mail.";
          break;
        case "ERROR_USER_DISABLED":
        case "user-disabled":
          error = "Usuário desativado.";
          break;
        case "ERROR_TOO_MANY_REQUESTS":
        case "operation-not-allowed":
          error =
              "Foram realizadas muitas requisições para acessar esta conta.";
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
        case "operation-not-allowed":
          error = "Erro de servidor, tente novamente mais tarde.";
          break;
        case "ERROR_INVALID_EMAIL":
        case "invalid-email":
          error = "E-mail inválido.";
          break;
        default:
          error = "O login falhou, tente novamente.";
          break;
      }
    }
  }
}
