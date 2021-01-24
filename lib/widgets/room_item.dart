import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hmiot/constants.dart';
import 'package:hmiot/screens/usage_screen.dart';

class RoomItem extends StatelessWidget {
  final String id;
  final String name;
  final String description;
  final Color colors;
  final String usage;

  RoomItem(this.id, this.name, this.description, this.colors, this.usage);

  void selectRoom(BuildContext context) {
    Navigator.of(context).pushNamed(UsageScreen.routeName, arguments: {
      'id': id,
      'name': name,
      'description': description,
      'color': colors,
      'usage': usage
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      onTap: () => selectRoom(context),
      title: Text(
        name,
        style: const TextStyle(
            fontSize: 17, fontWeight: FontWeight.bold, color: colorPrimaryDark),
      ),
      subtitle: Row(
        children: [
          Icon(Icons.offline_bolt, color: colors),
          SizedBox(
            width: 5,
          ),
          Text(description, style: TextStyle(color: colors))
        ],
      ),
      trailing: Text(usage + " kWh",
          style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: colorPrimaryDark)),
      leading: const CircleAvatar(
        child: const Icon(Icons.apartment),
      ),
    ));
  }
}
