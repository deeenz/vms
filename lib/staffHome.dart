import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visitor_management_system/model/visitorModel.dart';

class StaffHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StaffHome();
  }
}

class _StaffHome extends State<StaffHome> {
  TextEditingController searchBoxController = TextEditingController();
  List<Visitor> visitors = List<Visitor>();
  List<Visitor> _duplicateVisitors = List<Visitor>();

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final orientation = MediaQuery.of(context).orientation;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            PopupMenuButton<String>(
              icon: Icon(Icons.more_vert, size: 30),
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
        ),
        floatingActionButton: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/newVisit");
          },
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Theme.of(context).primaryColorLight),
            child: Icon(
              Icons.add,
              size: 40,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: visitors.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text("Visitor Information"),
                            content: Container(
                              height: screenHeight * .3,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Name: ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(visitors[index].name)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Email: ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(visitors[index].email)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Phone Number: ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(visitors[index].phoneNumber)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Company: ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(visitors[index].company)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Date of Visit: ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(visitors[index].dateOfVisit)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              RaisedButton(
                                color: Theme.of(context).primaryColor,
                                onPressed: () {
                                  //TODO new Visit
                                },
                                child: Text("New Visit"),
                              ),
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Cancel"),
                              )
                            ],
                          ),
                        );
                      },
                      child: ListTile(
                        title: Text(
                          visitors[index].name,
                          style: TextStyle(fontSize: 15),
                        ),
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
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * .021),
      height: MediaQuery.of(context).size.height * 0.04,
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
              fontSize: MediaQuery.of(context).size.width * 0.04),
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
          name: "Nurudeen",
          email: "taj@gmail.com",
          phoneNumber: "08037733738",
          dateOfVisit: "25/5/2018"),
    );
    visitors.add(
      Visitor(
          company: "Ilor Tech",
          name: "Nurudeen",
          email: "taj@gmail.com",
          phoneNumber: "08037733738",
          dateOfVisit: "25/5/2018"),
    );
    visitors.add(
      Visitor(
          company: "Ilor Tech",
          name: "Nurudeen",
          email: "taj@gmail.com",
          phoneNumber: "08037733738",
          dateOfVisit: "25/5/2018"),
    );
    visitors.add(
      Visitor(
          company: "Ilor Tech",
          name: "Nurudeen",
          email: "taj@gmail.com",
          phoneNumber: "08037733738",
          dateOfVisit: "25/5/2018"),
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
