import 'package:flutter/material.dart';
import 'package:hmiot/dummy_data.dart';
import 'package:hmiot/widgets/room_item.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = '/dashboard';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
            vertical: size.height * 0.002, horizontal: size.width * 0.01),
        children: dummyData
            .map((usageData) => RoomItem(
                  usageData.room.id,
                  usageData.room.name,
                  usageData.room.description,
                  usageData.room.colors,
                  usageData.room.usage,
                ))
            .toList(),
      ),
    );
  }
}
