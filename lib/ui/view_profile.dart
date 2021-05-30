import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ViewProfile extends StatefulWidget {
  ViewProfile({Key key}) : super(key: key);

  @override
  _ViewProfileState createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  @override
  Widget build(BuildContext context) {
    double _headingFontSize = 0.04 * MediaQuery.of(context).size.height;
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
                SizedBox(height: 25.0),
                Container(
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("Users")
                        .doc(FirebaseAuth.instance.currentUser.uid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      final Timestamp timestamp =
                          snapshot.data['date_of_birth'] as Timestamp;
                      final DateTime dateTime = timestamp.toDate();
                      return Column(
                        children: [
                          Container(
                            height: 75.0,
                            child: Image.asset(
                              "asset/images/user_icon.png",
                              isAntiAlias: true,
                            ),
                          ),
                          SizedBox(height: 25.0),
                          MaterialButton(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 15.0,
                            ),
                            elevation: 0.0,
                            focusElevation: 0.0,
                            hoverElevation: 0.0,
                            highlightElevation: 0.0,
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            color: Colors.green[700],
                            child: Text(
                              "Edit Profile".toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "ProximaNova",
                                fontSize: _contentFontSize * 0.9,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                          SizedBox(height: 25.0),
                          Text(
                            snapshot.data["name"].toString().toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "ProximaNova",
                              fontSize: _headingFontSize,
                            ),
                          ),
                          Text(
                            snapshot.data["email"],
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "ProximaNova",
                              fontSize: _subHeadingFontSize,
                            ),
                          ),
                          Text(
                            "${DateFormat('MMMM dd, yyyy').format(dateTime)}",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "ProximaNova",
                              fontSize: _subHeadingFontSize,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: 25.0),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Your Lists",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "ProximaNova",
                              fontSize: _contentFontSize,
                            ),
                          ),
                          Text(
                            "0",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "ProximaNova",
                              fontSize: _subHeadingFontSize,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Your Blogs",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "ProximaNova",
                              fontSize: _contentFontSize,
                            ),
                          ),
                          Text(
                            "0",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "ProximaNova",
                              fontSize: _subHeadingFontSize,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
