import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  final String title;

  Account(this.title);

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
