import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewVisit extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewVisit();
  }
}

class _NewVisit extends State<NewVisit> {
  GlobalKey<FormState> newVisitFormKey = GlobalKey<FormState>();
  TextEditingController nameControler = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController dateOfVisit = TextEditingController();

  DateTime visitDate;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: Text("Schedule Visit"),
      ),
      body: Center(
        child: Form(
          key: newVisitFormKey,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 100),
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                height: screenHeight * .1,
                width:
                    (MediaQuery.of(context).orientation == Orientation.portrait)
                        ? MediaQuery.of(context).size.width * 0.7
                        : 175,
                child: TextFormField(
                  controller: nameControler,
                  validator: (String val) {
                    if (val.isEmpty) {
                      return "Input Visitor Name";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    labelText: "Visitor Name",
                    labelStyle: TextStyle(fontSize: 12),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                height: screenHeight * .1,
                width:
                    (MediaQuery.of(context).orientation == Orientation.portrait)
                        ? MediaQuery.of(context).size.width * 0.7
                        : 175,
                child: TextFormField(
                  controller: emailController,
                  validator: (String val) {
                    if (val.isEmpty) {
                      return "Input Visitor Email";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    labelText: "Visitor Email",
                    labelStyle: TextStyle(fontSize: 12),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                height: screenHeight * .1,
                width:
                    (MediaQuery.of(context).orientation == Orientation.portrait)
                        ? MediaQuery.of(context).size.width * 0.7
                        : 175,
                child: TextFormField(
                  controller: phoneNumberController,
                  validator: (String val) {
                    if (val.isEmpty) {
                      return "Input Visitor Phone Number";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    labelText: "Visitor Phone Number",
                    labelStyle: TextStyle(fontSize: 12),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                height: screenHeight * .1,
                width:
                    (MediaQuery.of(context).orientation == Orientation.portrait)
                        ? MediaQuery.of(context).size.width * 0.7
                        : 175,
                child: TextFormField(
                  onTap: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(DateTime.now().year - 5),
                            lastDate: DateTime(DateTime.now().year + 30))
                        .then((value) {
                      setState(() {
                        dateOfVisit.text =
                            DateFormat('dd-MM-yyyy').format(value);
                      });
                    });
                  },
                  controller: phoneNumberController,
                  validator: (String val) {
                    if (val.isEmpty) {
                      return "Select Visitation Date";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.calendar_today_outlined),
                    labelText: "Visitor Phone Number",
                    labelStyle: TextStyle(fontSize: 12),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width:
                    (MediaQuery.of(context).orientation == Orientation.portrait)
                        ? MediaQuery.of(context).size.width * 0.7 - 10
                        : 175,
                height: screenHeight * .07,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: FlatButton(
                  padding: EdgeInsets.all(10),
                  onPressed: () {
                    if (newVisitFormKey.currentState.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("working"),
                        ),
                        //TODO save new visit
                      );
                    }
                  },
                  child: Text(
                    "Schedule Visit",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
