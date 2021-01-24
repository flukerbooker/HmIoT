import 'package:flutter/material.dart';

class Statistic extends StatelessWidget {
  final String title;

  Statistic(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(),
    );
  }
}
