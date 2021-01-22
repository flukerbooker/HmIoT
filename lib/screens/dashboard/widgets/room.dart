import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hmiot/screens/summary/summary.dart';

import '../../../constants.dart';

class Room extends StatelessWidget {
  final List<Summary> summary = [
    Summary('1', 'Room01', '+2% than yesterday', 93.6),
    Summary('2', 'Room02', '-7% than yesterday', 83.6),
    Summary('3', 'Room03', '+6% than yesterday', 95.5),
    Summary('4', 'Room04', '-14% than yesterday', 78.1),
    Summary('5', 'Room05', '-5% than yesterday', 86.2),
    Summary('6', 'Room06', '+1% than yesterday', 91.4),
    Summary('7', 'Room07', '+4% than yesterday', 95.6),
    Summary('8', 'Room08', '+2% than yesterday', 92.2),
    Summary('9', 'Room09', '-3% than yesterday', 87.9),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: summary.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(
              vertical: size.height * 0.002, horizontal: size.width * 0.02),
          child: Card(
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new Summary(
                        summary[index].roomId,
                        summary[index].roomName,
                        summary[index].description,
                        summary[index].totalUsage)));
              },
              title: Text(
                summary[index].roomName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  Icon(Icons.offline_bolt, color: colorGreyLight),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    summary[index].description,
                  ),
                ],
              ),
              leading: CircleAvatar(
                child: Icon(Icons.apartment),
              ),
              trailing: Text(
                summary[index].totalUsage.toString() + " kWh",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      },
    );
  }
}
