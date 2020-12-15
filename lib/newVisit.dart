import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:intl/intl.dart';
import 'package:visitor_management_system/model/visitorModel.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class NewVisit extends StatefulWidget {
  final Visitor visitor;

  NewVisit({this.visitor});

  @override
  State<StatefulWidget> createState() {
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
  void initState() {
    if (widget.visitor != null) {
      nameControler.text = widget.visitor.name;
      emailController.text = widget.visitor.email;
      phoneNumberController.text = widget.visitor.phoneNumber;
      companyController.text = widget.visitor.company;
      dateOfVisit.text = widget.visitor.dateOfVisit;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: Text("Schedule Visit"),
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Center(
            child: Form(
              key: newVisitFormKey,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    height: 60,
                    width: screenWidth * .7,
                    child: TextFormField(
                      controller: nameControler,
                      validator: (String val) {
                        if (val.isEmpty) {
                          return "Input Visitor Name";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_outline,
                            color: Theme.of(context).primaryColor),
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
                    margin: EdgeInsets.only(top: 10),
                    height: 60,
                    width: screenWidth * .7,
                    child: TextFormField(
                      controller: companyController,
                      validator: (String val) {
                        if (val.isEmpty) {
                          return "Input Visitor Company";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.home_work_outlined,
                            color: Theme.of(context).primaryColor),
                        labelText: "Company Name",
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
                    margin: EdgeInsets.only(top: 10),
                    height: 60,
                    width: screenWidth * .7,
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
                        prefixIcon: Icon(Icons.email_outlined,
                            color: Theme.of(context).primaryColor),
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
                    margin: EdgeInsets.only(top: 10),
                    height: 60,
                    width: screenWidth * .7,
                    child: TextFormField(
                      controller: phoneNumberController,
                      validator: (String val) {
                        if (val.isEmpty) {
                          return "Input Visitor Phone Number";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone_android_outlined,
                            color: Theme.of(context).primaryColor),
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
                    margin: EdgeInsets.only(top: 10),
                    height: 60,
                    width: screenWidth * .7,
                    child: TextFormField(
                      onTap: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(DateTime.now().year - 5),
                                lastDate: DateTime(DateTime.now().year + 30))
                            .then(
                          (value) {
                            setState(
                              () {
                                dateOfVisit.text =
                                    DateFormat('dd-MM-yyyy').format(value);
                              },
                            );
                          },
                        );
                      },
                      controller: dateOfVisit,
                      validator: (String val) {
                        if (val.isEmpty) {
                          return "Select Visitation Date";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.calendar_today_outlined,
                            color: Theme.of(context).primaryColor),
                        labelText: "Date of Visit",
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
                    width: screenWidth * .4,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: FlatButton(
                      onPressed: () {
                        if (newVisitFormKey.currentState.validate()) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Center(
                                  child: Text("Select Mode of Invitation"),
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: () {
                                      String message =
                                          "Tajudeen Nurudeen from Ilor Technologies is Inviting you with invite code: 231230 on ${dateOfVisit.text}. Please present this code to the front desk officer on your arrival for verification and authorization.";
                                      _sendSMS(message,
                                          [phoneNumberController.text]);
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      "SMS",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  FlatButton(
                                    onPressed: () async {
                                      String message =
                                          "Tajudeen Nurudeen from Ilor Technologies is Inviting you with invite code: 231230 on ${dateOfVisit.text}. Please present this code to the front desk officer on your arrival for verification and authorization.";

                                      final Email email = Email(
                                        body: message,
                                        subject: 'Inviation to Ilor Tech',
                                        recipients: [emailController.text],
                                        isHTML: false,
                                      );

                                      await FlutterEmailSender.send(email);

                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      "Email",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  SizedBox(width: 30)
                                ],
                              );
                            },
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
        ),
      ),
    );
  }

  void _sendSMS(String message, List<String> recipents) async {
    String _result = await sendSMS(message: message, recipients: recipents)
        .catchError((onError) {
      print(onError);
    });
    print(_result);
  }
}
