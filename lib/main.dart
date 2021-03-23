import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hmiot/constants.dart';
import 'package:hmiot/screens/dashboard_screen.dart';
import 'package:hmiot/screens/usage_screen.dart';

void main() {
  return runApp(HeaterApp());
}

class HeaterApp extends StatelessWidget {
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
      routes: {
        DashboardScreen.routeName: (ctx) => DashboardScreen(),
        UsageScreen.routeName: (ctx) => UsageScreen()
      },
    );
  }
}
