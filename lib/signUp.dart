import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUp();
  }
}

class _SignUp extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNUmberController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  GlobalKey<FormState> userSignUpKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

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
        key: key,
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  alignment: Alignment.center,
                  width: screenWidth,
                  child: Text(
                    "VISITOR MANAGEMENT SYSTEM",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  height: (orientation == Orientation.portrait)
                      ? screenHeight * .2
                      : 100),
              Container(
                width: screenWidth,
                height: (orientation == Orientation.portrait)
                    ? screenHeight - screenHeight * .2
                    : screenHeight - 100,
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          "Create Visitor Account",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),
                        ),
                      ),
                      Form(
                        key: userSignUpKey,
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(10),
                              height: screenHeight * 0.1,
                              width: (MediaQuery.of(context).orientation ==
                                      Orientation.portrait)
                                  ? MediaQuery.of(context).size.width * 0.7
                                  : 175,
                              child: TextFormField(
                                controller: nameController,
                                validator: (String val) {
                                  if (val.isEmpty) {
                                    return "Input Full Name";
                                  } else {
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  labelText: "Full Name",
                                  labelStyle: TextStyle(fontSize: 15),
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
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
                              width: (MediaQuery.of(context).orientation ==
                                      Orientation.portrait)
                                  ? MediaQuery.of(context).size.width * 0.7
                                  : 175,
                              child: TextFormField(
                                controller: emailController,
                                validator: (String val) {
                                  if (val.isEmpty) {
                                    return "Input Email";
                                  } else {
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  labelText: "Email",
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
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
                              width: (MediaQuery.of(context).orientation ==
                                      Orientation.portrait)
                                  ? MediaQuery.of(context).size.width * 0.7
                                  : 175,
                              child: TextFormField(
                                controller: phoneNUmberController,
                                validator: (String val) {
                                  if (val.isEmpty) {
                                    return "Input Phone Number";
                                  } else {
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.phone_android),
                                  labelText: "Phone Number",
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
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
                              width: (MediaQuery.of(context).orientation ==
                                      Orientation.portrait)
                                  ? MediaQuery.of(context).size.width * 0.7
                                  : 175,
                              child: TextFormField(
                                controller: companyController,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.home_outlined),
                                  labelText:
                                      "Company (Leave empty in case of personal visit)",
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
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
                              width: (MediaQuery.of(context).orientation ==
                                      Orientation.portrait)
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
                                  if (userSignUpKey.currentState.validate()) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("working"),
                                      ),
                                    );
                                  }
                                },
                                child: Text(
                                  "Get Started",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              alignment: Alignment.center,
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, "/login");
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Already have an Account? "),
                                      Text(
                                        "Login",
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 15),
                                      ),
                                    ],
                                  )),
                            )
                          ],
                        ),
                      )
                    ],
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
