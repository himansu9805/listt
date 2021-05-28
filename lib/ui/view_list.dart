import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/setting.dart';
import 'package:intl/intl.dart';

class ViewList extends StatelessWidget {
  final String uid;
  ViewList({Key key, @required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.black,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.0),
              Container(
                padding: EdgeInsets.all(15.0),
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Users")
                      .doc(FirebaseAuth.instance.currentUser.uid)
                      .collection("Lists")
                      .doc(uid)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            snapshot.data["title"],
                            style: TextStyle(
                                fontFamily: 'ProximaNova',
                                color: Colors.white,
                                fontSize:
                                    0.07 * MediaQuery.of(context).size.height,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          child: StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection("Users")
                                  .doc(FirebaseAuth.instance.currentUser.uid)
                                  .snapshots(),
                              builder: (context, userSnapshot) {
                                if (!userSnapshot.hasData) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                final Timestamp timestamp =
                                    snapshot.data['created_at'] as Timestamp;
                                final DateTime dateTime = timestamp.toDate();
                                return Container(
                                  child: Text(
                                    "${userSnapshot.data['name']} • ${DateFormat('MMMM dd, yyyy').format(dateTime)}",
                                    style: TextStyle(
                                        fontFamily: 'ProximaNova',
                                        color: Colors.greenAccent[400],
                                        fontSize: 0.02 *
                                            MediaQuery.of(context).size.height,
                                        fontWeight: FontWeight.w300),
                                  ),
                                );
                              }),
                        ),
                        SizedBox(height: 15.0),
                        Container(
                          child: Text(
                            snapshot.data["description"],
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontFamily: 'ProximaNova',
                              color: Colors.white60,
                              fontSize:
                                  0.025 * MediaQuery.of(context).size.height,
                            ),
                          ),
                        ),
                        SizedBox(height: 25.0),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white30,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 30.0,
                                    height: 30.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      color: Colors.white,
                                    ),
                                    child: Icon(
                                      Icons.list_rounded,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 25.0,
                                  ),
                                  Container(
                                    child: Text(
                                      "List Items",
                                      style: TextStyle(
                                        fontFamily: 'ProximaNova',
                                        fontSize: 17.5,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.0),
                              Container(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.all(5.0),
                                  itemCount: snapshot.data["list"].length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      height: 50,
                                      margin: EdgeInsets.symmetric(
                                        vertical: 5.0,
                                        horizontal: 10.0,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: Colors.black38,
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text(
                                              snapshot.data["list"][index],
                                              style: TextStyle(
                                                fontFamily: 'ProximaNova',
                                                fontSize: 17.5,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
