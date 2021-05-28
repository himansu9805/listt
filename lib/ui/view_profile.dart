import 'package:flutter/material.dart';

class ViewProfile extends StatefulWidget {
  ViewProfile({Key key}) : super(key: key);

  @override
  _ViewProfileState createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.black,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15.0),
            child: Column(children: [
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
            ]),
          ),
        ),
      ),
    );
  }
}
