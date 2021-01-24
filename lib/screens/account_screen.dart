import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  final String title;

  Account(this.title);

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
