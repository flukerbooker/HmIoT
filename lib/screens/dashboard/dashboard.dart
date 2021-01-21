import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text('Dashboard'),
      elevation: 0,
    );
  }
}
