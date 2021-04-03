import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:intl/intl.dart';

class StatisticUsage extends StatelessWidget {
  final List<dynamic> month;
  final List<dynamic> value;

  StatisticUsage({@required this.month, @required this.value});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Month", style: Theme.of(context).textTheme.headline6),
                Text("Total Usage",
                    style: Theme.of(context).textTheme.headline6),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: month.length,
            reverse: true,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(
                    DateFormat.yMMMM()
                        .format(DateTime.parse(month[index]['date'])),
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: colorPrimaryDark),
                  ),
                  trailing: Text(
                    value[index]['value'].toString() + " kWh",
                    style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: colorPrimaryDark),
                  ),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
