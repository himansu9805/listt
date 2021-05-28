import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/create_list.dart';
import 'package:flutter_application_1/ui/setting.dart';
import 'package:flutter_application_1/ui/view_list.dart';

class Counter extends StatefulWidget {
  Counter({Key key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  String _uid = FirebaseAuth.instance.currentUser.uid;

  final ScrollController _scrollController = ScrollController();

  String getTimeMessage(int currentHour) {
    if (currentHour >= 6 && currentHour < 12)
      return "Good Morning,";
    else if (currentHour >= 12 && currentHour < 17)
      return "Good Afternoon,";
    else if (currentHour >= 17 && currentHour < 22)
      return "Good Evening,";
    else
      return "Good Night,";
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                          splashColor: Colors.white54,
                          splashRadius: 40.0,
                        ),
                      ),
                      Container(
                        width: 40.0,
                        height: 40.0,
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Setting(),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.settings,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          splashColor: Colors.white54,
                          splashRadius: 40.0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.5),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          getTimeMessage(DateTime.now().hour),
                          style: TextStyle(
                            fontFamily: 'ProximaNova',
                            color: Colors.white,
                            fontSize: 0.05 * MediaQuery.of(context).size.height,
                          ),
                        ),
                      ),
                      Container(
                        child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("Users")
                              .doc(_uid)
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<DocumentSnapshot> snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return Container(
                              child: Text(
                                snapshot.data['name'].toString(),
                                style: TextStyle(
                                  fontFamily: 'ProximaNova',
                                  color: Colors.greenAccent[400],
                                  fontSize:
                                      0.06 * MediaQuery.of(context).size.height,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: Text(
                    "Your Lists",
                    style: TextStyle(
                      fontFamily: 'ProximaNova',
                      color: Colors.white,
                      fontSize: 0.04 * MediaQuery.of(context).size.height,
                    ),
                  ),
                ),
                Container(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("Users")
                        .doc(_uid)
                        .collection("Lists")
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.data.docs.length == 0) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white12,
                          ),
                          child: Container(
                            padding: EdgeInsets.all(15.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white30,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "You don't have any list.",
                                      style: TextStyle(
                                        fontFamily: 'ProximaNova',
                                        color: Colors.white,
                                        fontSize: 0.025 *
                                            MediaQuery.of(context).size.height,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "Create New List to continue.",
                                      style: TextStyle(
                                        fontFamily: 'ProximaNova',
                                        color: Colors.white,
                                        fontSize: 0.025 *
                                            MediaQuery.of(context).size.height,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      return Scrollbar(
                        isAlwaysShown: true,
                        controller: _scrollController,
                        child: ListView(
                          controller: _scrollController,
                          shrinkWrap: true,
                          children: snapshot.data.docs
                              .map(
                                (list) => Container(
                                  margin: EdgeInsets.all(10.0),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: MaterialButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ViewList(
                                            uid: list.id.toString(),
                                          ),
                                        ),
                                      );
                                    },
                                    elevation: 0.0,
                                    hoverElevation: 0.0,
                                    focusElevation: 0.0,
                                    highlightElevation: 0.0,
                                    color: Colors.white12,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.all(15.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 40.0,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              color: Colors.white30,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  list["title"],
                                                  style: TextStyle(
                                                    fontFamily: 'ProximaNova',
                                                    color: Colors.white,
                                                    fontSize: 0.025 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5.0,
                                                ),
                                                Text(
                                                  list["description"],
                                                  style: TextStyle(
                                                    fontFamily: 'ProximaNova',
                                                    color: Colors.white70,
                                                    fontSize: 0.02 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                MaterialButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateList(),
                      ),
                    );
                  },
                  color: Colors.greenAccent[700],
                  elevation: 0.0,
                  hoverElevation: 0.0,
                  focusElevation: 0.0,
                  highlightElevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 12,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Center(
                      child: Text(
                        'Create a list'.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'ProximaNova',
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
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
