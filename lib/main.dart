import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hmiot/constants.dart';
import 'package:hmiot/screens/dashboard_screen.dart';
import 'package:hmiot/screens/login_screen.dart';
import 'package:hmiot/screens/signup_screen.dart';
import 'package:hmiot/screens/statistic_screen.dart';
import 'package:hmiot/screens/usage_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  return runApp(HeaterApp());
}

class HeaterApp extends StatefulWidget {
  @override
  _HeaterAppState createState() => _HeaterAppState();
}

class _HeaterAppState extends State<HeaterApp> {
  bool _isLoggedIn = false;

  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async {
    // check if token is there
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      setState(() {
        _isLoggedIn = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heater Project',
      theme: ThemeData(
          primaryColor: colorPrimary,
          primaryColorDark: colorPrimaryDark,
          backgroundColor: colorBackground,
          fontFamily: 'Roboto',
          appBarTheme: AppBarTheme(
              textTheme: TextTheme(
                  headline6:
                      TextStyle(fontSize: 24, fontWeight: FontWeight.w700))),
          textTheme: TextTheme(
            headline4: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: colorPrimaryDark),
            headline5: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: colorPrimaryLight),
            headline6: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: colorPrimaryLight),
          )),
      initialRoute: _isLoggedIn ? '/dashboard' : '/login',
      routes: {
        LoginScreen.routeName: (ctx) => LoginScreen(),
        SignupScreen.routeName: (ctx) => SignupScreen(),
        DashboardScreen.routeName: (ctx) => DashboardScreen(),
        UsageScreen.routeName: (ctx) => UsageScreen(),
        StatisticScreen.routeName: (ctx) => StatisticScreen(),
      },
    );
  }
}
