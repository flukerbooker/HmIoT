import 'package:flutter/material.dart';
import 'package:hmiot/widgets/room_item.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Room(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text('Dashboard'),
      elevation: 0,
    );
  }
}
