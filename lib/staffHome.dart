import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visitor_management_system/model/visitorModel.dart';
import 'package:visitor_management_system/newVisit.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:visitor_management_system/showVisitorDetails.dart';

class StaffHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StaffHome();
  }
}

class _StaffHome extends State<StaffHome> {
  TextEditingController searchBoxController = TextEditingController();

  List<Visitor> visitors = List<Visitor>();
  List<Visitor> _duplicateVisitors = List<Visitor>();

  List<Color> colors = [
    Colors.purple[100],
    Colors.green[200],
    Colors.orange[200],
    Colors.yellow[200]
  ];
  var random = Random.secure();

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            PopupMenuButton<String>(
              icon: Icon(Icons.more_vert, size: 30, color: Colors.white),
              onSelected: handleClick,
              itemBuilder: (BuildContext context) {
                return {'Logout', 'Change Password'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
          title: _buildSearchTextField(),
          leading: Padding(
            padding: const EdgeInsets.all(2.0),
            child: GestureDetector(
              onTap: () {
                //TODO GOTO PROFILE
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Icon(
                  Icons.person,
                  color: Colors.grey,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: GestureDetector(
          onTap: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (context) {
                return NewVisit();
              },
            );
          },
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Theme.of(context).primaryColorLight),
            child: Icon(
              Icons.add,
              size: 30,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: visitors.length,
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(height: 1, color: Colors.grey[300]),
                  );
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ShowDetails(visitor: visitors[index]),
                        ),
                      );
                    },
                    child: Container(
                      height: 100,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: screenWidth * .05),
                            width: 60,
                            height: 60,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              color: colors[random.nextInt(4)],
                              child: Center(
                                child: Text(
                                  visitors[index].name[0],
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: screenWidth * .5,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(visitors[index].name,
                                style: TextStyle(fontSize: 15)),
                          ),
                          Container(
                            width: screenWidth * .3,
                            alignment: Alignment.center,
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Theme.of(context).primaryColor,
                              child: Text("Invite"),
                              onPressed: () => showModalBottomSheet<void>(
                                context: context,
                                builder: (context) {
                                  return NewVisit(visitor: visitors[index]);
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void filterSearchResults(String query) {
    if (query != "") {
      var _a = query.substring(1);
      var _firstLetter = query[0].toUpperCase();
      var _realQuery = _firstLetter + _a;

      List<Visitor> dummyListData = new List<Visitor>();
      for (var vistor in _duplicateVisitors) {
        if (vistor.name.contains(_realQuery)) {
          dummyListData.add(vistor);
        }
      }
      setState(() {
        visitors = dummyListData;
      });
    } else {
      setState(() {
        visitors = _duplicateVisitors;
      });
    }
  }

  Widget _buildSearchTextField() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).primaryColorLight,
      ),
      child: TextField(
        onChanged: (value) {
          filterSearchResults(value);
        },
        cursorColor: Color(0XF757575),
        controller: searchBoxController,
        decoration: InputDecoration(
          fillColor: Theme.of(context).primaryColorLight,
          labelText: "Search",
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelStyle: TextStyle(
            color: Theme.of(context).hintColor,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Theme.of(context).hintColor,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0.0, color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 0),
          ),
        ),
      ),
    );
  }

  void fetchData() {
    visitors.add(
      Visitor(
        company: "Ilor Tech",
        name: "Nurudeen Tajudeen",
        email: "taj@gmail.com",
        phoneNumber: "07033673269",
      ),
    );
    visitors.add(
      Visitor(
        company: "Ilor Tech",
        name: "Mikail Femi",
        email: "taj@gmail.com",
        phoneNumber: "08136100678",
      ),
    );
    visitors.add(
      Visitor(
        company: "Ilor Tech",
        name: "Abdullateef Shittu",
        email: "taj@gmail.com",
        phoneNumber: "08037733738",
      ),
    );
    _duplicateVisitors.addAll(visitors);
    // TODO fetch data from api and populate visitors
  }

  void handleClick(String value) {
    switch (value) {
      case 'Logout':
        Navigator.pushReplacementNamed(context, "/login");
        break;
      case 'Change Password':
        Navigator.pushNamed(context, "/changePassword");
        break;
    }
  }
}
