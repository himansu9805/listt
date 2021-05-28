import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/net/flutterfire.dart';
import 'package:flutter_application_1/ui/setting.dart';

class CreateList extends StatefulWidget {
  CreateList({Key key}) : super(key: key);

  @override
  _CreateListState createState() => _CreateListState();
}

class _CreateListState extends State<CreateList> {
  TextEditingController _titleController = new TextEditingController();
  TextEditingController _descriptionController = new TextEditingController();
  TextEditingController _itemController = new TextEditingController();

  final List<String> _listItems = <String>[];

  var _formKey = GlobalKey<FormState>();
  var _itemFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Material(
        child: Container(
          color: Colors.black,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                      Container(
                        child: Text(
                          "Create a new",
                          style: TextStyle(
                            fontFamily: 'ProximaNova',
                            color: Colors.white,
                            fontSize: 0.05 * MediaQuery.of(context).size.height,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          "LIST",
                          style: TextStyle(
                            fontFamily: 'ProximaNova',
                            color: Colors.greenAccent[700],
                            letterSpacing: 10.0,
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
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: TextFormField(
                            controller: _titleController,
                            style: TextStyle(
                              fontFamily: 'ProximaNova',
                              color: Colors.white,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the title of your list';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white12,
                              labelText: "Title",
                              labelStyle: TextStyle(color: Colors.white),
                              hintText: "Enter the title of your list",
                              hintStyle: TextStyle(color: Colors.white38),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.25,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.greenAccent[700],
                                  width: 1.5,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.redAccent[700],
                                  width: 1.25,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.redAccent[700],
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
                          width: MediaQuery.of(context).size.width,
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: 8,
                            controller: _descriptionController,
                            style: TextStyle(
                              fontFamily: 'ProximaNova',
                              color: Colors.white,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the description of your list';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white12,
                              labelText: "Description",
                              alignLabelWithHint: true,
                              labelStyle: TextStyle(color: Colors.white),
                              hintText: "Enter the description of your list",
                              hintStyle: TextStyle(color: Colors.white38),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.25,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.greenAccent[700],
                                  width: 1.5,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.redAccent[700],
                                  width: 1.25,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.redAccent[700],
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
                          width: MediaQuery.of(context).size.width,
                          child: Row(
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
                        ),
                        _listItems.length == 0
                            ? SizedBox(height: 0.0)
                            : SizedBox(height: 25.0),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: _listItems.length == 0
                              ? null
                              : BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.0),
                                  color: Colors.white12,
                                ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(8),
                            itemCount: _listItems.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                height: 50,
                                margin: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.black38,
                                ),
                                child: Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        _listItems[index],
                                        style: TextStyle(
                                          fontFamily: 'ProximaNova',
                                          fontSize: 17.5,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                                color: Colors.redAccent[700],
                                              ),
                                              child: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    _listItems.remove(
                                                        _listItems[index]);
                                                  });
                                                },
                                                icon: Icon(
                                                  Icons.remove,
                                                ),
                                                color: Colors.white,
                                                iconSize: 10.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Form(
                            key: _itemFormKey,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: TextFormField(
                                    controller: _itemController,
                                    style: TextStyle(
                                      fontFamily: 'ProximaNova',
                                      color: Colors.white,
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white12,
                                      labelText: "Item",
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      hintText: "Enter the list item",
                                      hintStyle:
                                          TextStyle(color: Colors.white38),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.25,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        borderSide: BorderSide(
                                          color: Colors.greenAccent[700],
                                          width: 1.5,
                                        ),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        borderSide: BorderSide(
                                          color: Colors.redAccent[700],
                                          width: 1.25,
                                        ),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        borderSide: BorderSide(
                                          color: Colors.redAccent[700],
                                          width: 1.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 25.0,
                                ),
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          color: Colors.greenAccent[700],
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              final isValid = _itemFormKey
                                                  .currentState
                                                  .validate();
                                              if (!isValid) {
                                                return;
                                              }
                                              _itemFormKey.currentState.save();
                                              _listItems
                                                  .add(_itemController.text);
                                            });
                                          },
                                          icon: Icon(Icons.add),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Container(
                          child: MaterialButton(
                            onPressed: () async {
                              final isValid = _formKey.currentState.validate();
                              if (!isValid) {
                                return;
                              }
                              _formKey.currentState.save();
                              bool hasCreated = await createList(
                                  _titleController.text,
                                  _descriptionController.text,
                                  _listItems);
                              if (hasCreated) {
                                Navigator.pop(context);
                              }
                            },
                            color: Colors.greenAccent[700],
                            elevation: 0.0,
                            hoverElevation: 0.0,
                            focusElevation: 0.0,
                            highlightElevation: 0.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 12,
                              width: MediaQuery.of(context).size.width / 2,
                              child: Center(
                                child: Text(
                                  "Create".toUpperCase(),
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                    fontSize: 15.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
