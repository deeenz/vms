import 'package:flutter/material.dart';
import 'package:visitor_management_system/changePassword.dart';
import 'package:visitor_management_system/forgotPassword.dart';
import 'package:visitor_management_system/home.dart';
import 'package:visitor_management_system/login.dart';
import 'package:visitor_management_system/newVisit.dart';
import 'package:visitor_management_system/staffHome.dart';
import 'package:visitor_management_system/showVisitorDetails.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
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
      home: Login(),
      routes: {
        "/home": (context) => Home(),
        "/login": (context) => Login(),
        "/forgotPassword": (context) => ForgotPassword(),
        "/staffHome": (context) => StaffHome(),
        "/newVisit": (context) => NewVisit(),
        "/changePassword": (context) => ChangePassword(),
      },
    );
  }
}
