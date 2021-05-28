import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/ui/counter.dart';
import 'package:flutter_application_1/ui/forgot_password.dart';
import 'package:flutter_application_1/ui/login.dart';
import 'package:flutter_application_1/ui/preLogin.dart';
import 'package:flutter_application_1/ui/register.dart';
import 'package:flutter_application_1/ui/setting.dart';
import 'package:flutter_application_1/ui/view_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String email = prefs.getString('email');
  String password = prefs.getString('password');
  runApp(MyApp(
    email: email,
    password: password,
  ));
}

class MyApp extends StatelessWidget {
  final String email;
  final String password;
  MyApp({Key key, @required this.email, @required this.password})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/prelogin',
      routes: {
        '/prelogin': (context) => PreLogin(email: email, password: password),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/forgotpassword': (context) => ForgotPassword(),
        '/home': (context) => Counter(),
        '/settings': (context) => Setting(),
        '/viewprofile': (context) => ViewProfile(),
      },
      theme: ThemeData(
        accentColor: Colors.greenAccent[700],
      ),
    );
  }
}
