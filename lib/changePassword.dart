import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChangePassword();
  }
}

class _ChangePassword extends State<ChangePassword> {
  GlobalKey<FormState> changePasswordFormKey = GlobalKey<FormState>();
  TextEditingController newPasswordController = TextEditingController();
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
          title: Text("Change Password"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Form(
                key: changePasswordFormKey,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 100),
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      height: screenHeight * .1,
                      width: (MediaQuery.of(context).orientation ==
                              Orientation.portrait)
                          ? MediaQuery.of(context).size.width * 0.7
                          : 175,
                      child: TextFormField(
                        controller: newPasswordController,
                        validator: (String val) {
                          if (val.isEmpty) {
                            return "Input New Password";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email,
                              color: Theme.of(context).primaryColor),
                          labelText: "New Password",
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
                          if (changePasswordFormKey.currentState.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("working"),
                              ),
                            );
                          }
                        },
                        child: Text(
                          "Change Password",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
