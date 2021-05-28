import 'package:flutter/material.dart';
import 'package:flutter_application_1/net/flutterfire.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_animations/simple_animations.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  bool _obscurePassword = true;

  String _message = "";

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xfff44336),
              Color(0xff2196f3),
            ],
          ),
          backgroundBlendMode: BlendMode.srcOver,
        ),
        child: PlasmaRenderer(
          type: PlasmaType.circle,
          particles: 3,
          color: Color(0x440008ff),
          blur: 0.51,
          size: 2.37,
          speed: 3.28,
          offset: 0,
          blendMode: BlendMode.plus,
          particleType: ParticleType.atlas,
          variation1: 0,
          variation2: 0,
          variation3: 0,
          rotation: 0,
          child: Container(
            color: Colors.black26,
            child: SingleChildScrollView(
              child: Container(
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
                            "Login with your",
                            style: TextStyle(
                              fontFamily: 'ProximaNova',
                              color: Colors.white,
                              fontSize:
                                  0.05 * MediaQuery.of(context).size.height,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Text(
                            "ACCOUNT",
                            style: TextStyle(
                              fontFamily: 'ProximaNova',
                              color: Colors.greenAccent[700],
                              letterSpacing: 4.0,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  0.07 * MediaQuery.of(context).size.height,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    if (_message.isEmpty || _message == "Verified")
                      SizedBox(
                        height: 0,
                      )
                    else
                      Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.redAccent[200].withOpacity(0.5),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.error,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: Text(
                                  _message,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "ProximaNova",
                                  ),
                                ),
                              ),
                            ],
                          )),
                    SizedBox(
                      height: 25.0,
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
                          icon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
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
                    SizedBox(
                      height: 25.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextFormField(
                        controller: _passwordController,
                        style: TextStyle(
                          fontFamily: 'ProximaNova',
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white12,
                          icon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          suffixIcon: Container(
                            padding: EdgeInsets.only(right: 15.0),
                            child: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.white30,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                          ),
                          labelText: "Password",
                          labelStyle: TextStyle(
                            fontFamily: 'ProximaNova',
                            color: Colors.white,
                          ),
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
                                MediaQuery.of(context).size.height / 35),
                            borderSide: BorderSide(
                              color: Colors.greenAccent[700],
                              width: 1.5,
                            ),
                          ),
                        ),
                        obscureText: _obscurePassword,
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/forgotpassword');
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            fontFamily: "ProximaNova",
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40.0),
                    Column(
                      children: [
                        MaterialButton(
                          onPressed: () async {
                            String message = await signIn(_emailController.text,
                                _passwordController.text);
                            setState(() {
                              _message = message;
                            });
                            if (_message == "Verified") {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setString('email', _emailController.text);
                              prefs.setString(
                                  'password', _passwordController.text);
                              Navigator.of(context).pushReplacementNamed(
                                '/home',
                              );
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
                                'Login'.toUpperCase(),
                                style: TextStyle(
                                  fontFamily: 'ProximaNova',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 0.021 *
                                      MediaQuery.of(context).size.height,
                                  letterSpacing: 2.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 25.0),
                        MaterialButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed('/register');
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
                                'Register'.toUpperCase(),
                                style: TextStyle(
                                  fontFamily: 'ProximaNova',
                                  color: Colors.greenAccent[400],
                                  fontWeight: FontWeight.w500,
                                  fontSize: 0.021 *
                                      MediaQuery.of(context).size.height,
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
          ),
        ),
      ),
    );
  }
}
