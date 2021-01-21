import 'package:flutter/material.dart';
import 'package:hmiot/screens/summary/widgets/usages.dart';

class Summary extends StatelessWidget {
  final String roomId;
  final String roomName;

  Summary(this.roomId, this.roomName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Usages(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text('Summary'),
      elevation: 0,
    );
  }
}
