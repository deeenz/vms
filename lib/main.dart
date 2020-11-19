import 'package:flutter/material.dart';
import 'package:visitor_management_system/changePassword.dart';
import 'package:visitor_management_system/forgotPassword.dart';
import 'package:visitor_management_system/login.dart';
import 'package:visitor_management_system/newVisit.dart';
import 'package:visitor_management_system/signUp.dart';
import 'package:visitor_management_system/staffHome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Visitor Management System',
      theme: ThemeData(
          primaryColor: Color(0XFF66bb6a),
          primaryColorLight: Color(0XFF98ee99),
          primaryColorDark: Color(0XFF338a3e)),
      home: SignUp(),
      routes: {
        "/signUp": (context) => SignUp(),
        "/login": (context) => Login(),
        "/forgotPassword": (context) => ForgotPassword(),
        "/staffHome": (context) => StaffHome(),
        "/newVisit": (context) => NewVisit(),
        "/changePassword": (context) => ChangePassword()
      },
    );
  }
}
