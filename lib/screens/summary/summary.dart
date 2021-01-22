import 'package:flutter/material.dart';
import 'package:hmiot/screens/summary/widgets/usages.dart';

class Summary extends StatelessWidget {
  final String roomId;
  final String roomName;
  final String description;
  final double totalUsage;

  Summary(this.roomId, this.roomName, this.description, this.totalUsage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Usages(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(roomName),
      elevation: 0,
    );
  }
}
