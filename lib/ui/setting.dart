import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  Setting({Key key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  String _preferredLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    double _headingFontSize = 0.025 * MediaQuery.of(context).size.height;
    double _subHeadingFontSize = 0.0225 * MediaQuery.of(context).size.height;
    double _contentFontSize = 0.02 * MediaQuery.of(context).size.height;

    return Material(
      child: Container(
        color: Colors.black,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 40.0,
                        height: 40.0,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.resolveWith(
                              (states) => CircleBorder(),
                            ),
                            overlayColor: MaterialStateProperty.resolveWith(
                              (states) =>
                                  Colors.greenAccent[700].withOpacity(0.5),
                            ),
                          ),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 20.0,
                          ),
                        ),
                      ),
                      Container(
                        width: 40.0,
                        height: 40.0,
                        child: TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            shape: MaterialStateProperty.resolveWith(
                              (states) => CircleBorder(),
                            ),
                            overlayColor: MaterialStateProperty.resolveWith(
                              (states) =>
                                  Colors.greenAccent[700].withOpacity(0.5),
                            ),
                          ),
                          child: Icon(
                            Icons.info_outline,
                            color: Colors.white,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Text(
                    "Settings",
                    style: TextStyle(
                      fontFamily: "ProximaNova",
                      color: Colors.white,
                      fontSize: 0.05 * MediaQuery.of(context).size.height,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("Users")
                        .doc(FirebaseAuth.instance.currentUser.uid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed("/viewprofile");
                          },
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed))
                                return Colors.white54;
                              return Colors.white;
                            }),
                            overlayColor: MaterialStateProperty.resolveWith(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed))
                                return Colors.greenAccent[700].withOpacity(0.5);
                              return null;
                            }),
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 15.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text(
                                    snapshot.data["name"],
                                    style: TextStyle(
                                      fontFamily: "ProximaNova",
                                      fontSize: _subHeadingFontSize,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: Text(
                                        "View Profile",
                                        style: TextStyle(
                                          fontFamily: "ProximaNova",
                                          fontSize: _subHeadingFontSize,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5.0),
                                    Container(
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 30.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "Account".toUpperCase(),
                            style: TextStyle(
                              fontFamily: "ProximaNova",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: _headingFontSize,
                            ),
                          ),
                        ),
                        SizedBox(height: 25.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                "Email",
                                style: TextStyle(
                                  fontFamily: "ProximaNova",
                                  color: Colors.white,
                                  fontSize: _subHeadingFontSize,
                                ),
                              ),
                            ),
                            Container(
                              child: StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection("Users")
                                    .doc(FirebaseAuth.instance.currentUser.uid)
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                  return Container(
                                    child: Text(
                                      snapshot.data["email"],
                                      style: TextStyle(
                                        fontFamily: "ProximaNova",
                                        color: Colors.white70,
                                        fontSize: _contentFontSize,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25.0),
                        Container(
                          child: Text(
                            "Language".toUpperCase(),
                            style: TextStyle(
                              fontFamily: "ProximaNova",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: _headingFontSize,
                            ),
                          ),
                        ),
                        SizedBox(height: 25.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                child: Text(
                                  "Select your preferred language",
                                  style: TextStyle(
                                    fontFamily: "ProximaNova",
                                    color: Colors.white,
                                    fontSize: _subHeadingFontSize,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 15.0),
                              decoration: BoxDecoration(color: Colors.white24),
                              child: DropdownButton<String>(
                                value: _preferredLanguage,
                                icon: Icon(Icons.arrow_downward),
                                style: TextStyle(
                                  fontFamily: "ProximaNova",
                                  color: Colors.white,
                                  fontSize: _contentFontSize,
                                ),
                                underline: Container(
                                  color: Colors.transparent,
                                ),
                                onChanged: (String newValue) {
                                  setState(() {
                                    _preferredLanguage = newValue;
                                  });
                                },
                                dropdownColor: Colors.grey[800],
                                items: <String>[
                                  'English',
                                  'हिन्दी',
                                  '한국어',
                                  '日本語',
                                  'русский',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25.0),
                        Container(
                          child: Text(
                            "Help".toUpperCase(),
                            style: TextStyle(
                              fontFamily: "ProximaNova",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: _headingFontSize,
                            ),
                          ),
                        ),
                        SizedBox(height: 25.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                "Terms and Conditions",
                                style: TextStyle(
                                  fontFamily: "ProximaNova",
                                  color: Colors.white,
                                  fontSize: _subHeadingFontSize,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                'All the stuff you need to know.',
                                style: TextStyle(
                                  fontFamily: "ProximaNova",
                                  color: Colors.white70,
                                  fontSize: _contentFontSize,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                "Privacy Policy",
                                style: TextStyle(
                                  fontFamily: "ProximaNova",
                                  color: Colors.white,
                                  fontSize: _subHeadingFontSize,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                'This is important for both sides.',
                                style: TextStyle(
                                  fontFamily: "ProximaNova",
                                  color: Colors.white70,
                                  fontSize: _contentFontSize,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                "Support",
                                style: TextStyle(
                                  fontFamily: "ProximaNova",
                                  color: Colors.white,
                                  fontSize: _subHeadingFontSize,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                'Stop it! Get some help.',
                                style: TextStyle(
                                  fontFamily: "ProximaNova",
                                  color: Colors.white70,
                                  fontSize: _contentFontSize,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25.0),
                        Container(
                          child: Text(
                            "Other".toUpperCase(),
                            style: TextStyle(
                              fontFamily: "ProximaNova",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: _headingFontSize,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextButton(
                          onPressed: () async {
                            // SharedPreferences prefs =
                            //     await SharedPreferences.getInstance();
                            // prefs.remove("email");
                            // prefs.remove("password");
                            // await FirebaseAuth.instance.signOut();
                            // Navigator.of(context).pushNamedAndRemoveUntil(
                            //   '/login',
                            //   (Route<dynamic> route) => false,
                            // );
                          },
                          style: ButtonStyle(
                            textStyle:
                                MaterialStateProperty.resolveWith<TextStyle>(
                                    (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed))
                                return TextStyle(
                                    fontSize: _contentFontSize - 0.1);
                              return TextStyle(fontSize: _contentFontSize);
                            }),
                            foregroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed))
                                return Colors.white54;
                              return Colors.white;
                            }),
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    "Log out",
                                    style: TextStyle(
                                      fontFamily: "ProximaNova",
                                      fontSize: _subHeadingFontSize,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: StreamBuilder(
                                    stream: FirebaseFirestore.instance
                                        .collection("Users")
                                        .doc(FirebaseAuth
                                            .instance.currentUser.uid)
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                      return Container(
                                        child: Text(
                                          'You are logged in as ${snapshot.data["name"]}',
                                          style: TextStyle(
                                            fontFamily: "ProximaNova",
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
