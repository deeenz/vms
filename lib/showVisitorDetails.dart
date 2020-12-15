import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visitor_management_system/model/visitorModel.dart';

import 'newVisit.dart';

class ShowDetails extends StatelessWidget {
  final Visitor visitor;
  ShowDetails({this.visitor});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    List<Color> colors = [
      Colors.purple[100],
      Colors.green[200],
      Colors.orange[200],
      Colors.yellow[200]
    ];
    var random = Random.secure();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      floatingActionButton: GestureDetector(
        onTap: () => showModalBottomSheet<void>(
          context: context,
          builder: (context) {
            return NewVisit(visitor: visitor);
          },
        ),
        child: Container(
          width: 200,
          height: 50,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Theme.of(context).primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    "Edit before Invite",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: screenWidth * .1, bottom: 20),
            width: 150,
            height: 150,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(200)),
              color: colors[random.nextInt(4)],
              child: Center(
                child: Text(
                  visitor.name[0],
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: Text(
              visitor.name,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey[350],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Email: " + visitor.email,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey[350],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Phone Number: " + visitor.phoneNumber,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey[350],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Company Name: " + visitor.company,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
