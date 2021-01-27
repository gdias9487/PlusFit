import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plusfit/authentication.dart';
import 'package:plusfit/components/constants.dart';
import 'package:plusfit/pages/cardiovascular.dart';
import 'package:plusfit/pages/inferior.dart';
import 'package:plusfit/pages/loginpage.dart';
import 'package:plusfit/pages/homePage.dart';
import 'package:plusfit/pages/profilePage.dart';
import 'package:plusfit/pages/resetpasswordPage.dart';
import 'package:plusfit/pages/aboutPage.dart';
import 'package:plusfit/pages/exercisesPage.dart';
import 'package:plusfit/pages/signupPage.dart';
import 'package:plusfit/pages/signupPage2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:plusfit/pages/superior.dart';
import 'package:provider/provider.dart';
import 'package:plusfit/pages/editperfilPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(PFApp());
}

class PFApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance),
          ),
          StreamProvider(
              create: (context) =>
                  context.read<AuthenticationService>().authStateChanges),
        ],
        child: MaterialApp(
          initialRoute: '/',
          routes: <String, WidgetBuilder>{
            '/home': (context) => HomePage(),
            '/login': (context) => LoginPage(),
            '/signup': (context) => SignupPage(),
            '/reset': (context) => ResetPassword(),
            '/about': (context) => AboutPage(),
            '/exercises': (context) => ExercisePage(),
            '/signup2': (context) => SignupprfPage(),
            '/perfil': (context) => PerfilPage(),
            '/edit': (context) => EditPage(),
            '/superior': (context) => SuperiorPage(),
            '/inferior': (context) => InferiorPage(),
            '/cardio': (context) => CardiovascularPage(),
          },
          title: 'PlusFit v1.0',
          theme: ThemeData(
            primaryColor: porange,
            primarySwatch: Colors.deepOrange,
          ),
          home: HomePage(title: 'PlusFit'),
          debugShowCheckedModeBanner: false,
        ));
  }
}
