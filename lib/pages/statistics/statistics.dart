import 'package:flutter/material.dart';

class Statistic extends StatelessWidget {
  final String title;

  Statistic(this.title);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: Container(),
    );
  }
}
