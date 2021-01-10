import 'package:flutter/material.dart';
import 'package:hmiot/constants.dart';
import 'package:hmiot/pages/home/homepage.dart';

void main() {
  return runApp(HeaterApp());
}

class HeaterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heater Project',
      theme: ThemeData(
          primaryColor: colorPrimary, primaryColorDark: colorPrimaryDark),
      home: HomePage(),
    );
  }
}
