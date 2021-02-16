import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:plusfit/authentication.dart';

class Controller extends ControllerMVC {
  AuthenticationService _auth = AuthenticationService();

  resetPassword(email) {
    _auth.resetPassword(email);
  }
}
