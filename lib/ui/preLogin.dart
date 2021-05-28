import 'package:flutter/material.dart';
import 'package:flutter_application_1/net/flutterfire.dart';

class PreLogin extends StatefulWidget {
  final String email;
  final String password;
  PreLogin({Key key, @required this.email, @required this.password})
      : super(key: key);

  @override
  _PreLogin createState() => _PreLogin(email: email, password: password);
}

class _PreLogin extends State<PreLogin> {
  final String email;
  final String password;
  _PreLogin({@required this.email, @required this.password});

  void verifyLogin() async {
    await Future.delayed(Duration(seconds: 3));
    if (email != null && password != null) {
      String message = await signIn(email, password);
      if (message == "Verified") {
        Navigator.of(context).pushNamedAndRemoveUntil(
          '/home',
          (Route<dynamic> route) => false,
        );
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil(
          '/login',
          (Route<dynamic> route) => false,
        );
      }
    } else {
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/login',
        (Route<dynamic> route) => false,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    verifyLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
