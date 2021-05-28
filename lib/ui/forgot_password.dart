import 'package:flutter/material.dart';
import 'package:flutter_application_1/net/flutterfire.dart';
import 'package:flutter_application_1/ui/login.dart';

import 'setting.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromRGBO(116, 18, 203, 1),
              Color.fromRGBO(230, 46, 131, 1),
            ],
          ),
        ),
        child: Container(
          color: Colors.black38,
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40.0,
                      height: 40.0,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 20.0,
                        ),
                      ),
                    ),
                    Container(
                      width: 40.0,
                      height: 40.0,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.info_outline,
                          color: Colors.white,
                          size: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      "Forgot your",
                      style: TextStyle(
                        fontFamily: 'ProximaNova',
                        color: Colors.white,
                        fontSize: 0.05 * MediaQuery.of(context).size.height,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      "PASSWORD",
                      style: TextStyle(
                        fontFamily: 'ProximaNova',
                        color: Colors.greenAccent[700],
                        letterSpacing: 4.0,
                        fontWeight: FontWeight.bold,
                        fontSize: 0.07 * MediaQuery.of(context).size.height,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Text(
                  "Enter the email associated with your account",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: "ProximaNova",
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  controller: _emailController,
                  style: TextStyle(
                    fontFamily: 'ProximaNova',
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white12,
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.height / 35),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.25,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.height / 35,
                      ),
                      borderSide: BorderSide(
                        color: Colors.greenAccent[700],
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              Column(
                children: [
                  MaterialButton(
                    onPressed: () async {
                      bool hasLinkSent =
                          await resetPassword(_emailController.text);
                      if (hasLinkSent) {
                        print("Link sent!");
                      }
                    },
                    color: Colors.greenAccent[700],
                    elevation: 0.0,
                    hoverElevation: 0.0,
                    focusElevation: 0.0,
                    highlightElevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.height / 24),
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 12,
                      width: MediaQuery.of(context).size.width / 2,
                      child: Center(
                        child: Text(
                          'Continue'.toUpperCase(),
                          style: TextStyle(
                            fontFamily: 'ProximaNova',
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize:
                                0.021 * MediaQuery.of(context).size.height,
                            letterSpacing: 2.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25.0),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );
                    },
                    color: Colors.transparent,
                    elevation: 0.0,
                    hoverElevation: 0.0,
                    focusElevation: 0.0,
                    highlightElevation: 0.0,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.greenAccent[700],
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.height / 24),
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 12,
                      width: MediaQuery.of(context).size.width / 2,
                      child: Center(
                        child: Text(
                          'Login'.toUpperCase(),
                          style: TextStyle(
                            fontFamily: 'ProximaNova',
                            color: Colors.greenAccent[400],
                            fontWeight: FontWeight.w500,
                            fontSize:
                                0.021 * MediaQuery.of(context).size.height,
                            letterSpacing: 2.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
