import 'package:flutter/material.dart';
import 'package:hmiot/models/statistic.dart';
import 'package:hmiot/widgets/statistic_graph.dart';

import '../constants.dart';

class StatisticScreen extends StatelessWidget {
  static const routeName = '/usage/statistic';

  final String title;
  final List<Statistic> statistic = [
    Statistic(count: 1262, month: 'Jan'),
    Statistic(count: 1482, month: 'Feb'),
    Statistic(count: 1654, month: 'Mar'),
  ];

  StatisticScreen(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text("Total Usage by month", style: Theme.of(context).textTheme.headline6),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              height: 300,
              child: StatisticGraph(statistic: statistic),
            ),
            Container(
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
                        Text("Total Usage", style: Theme.of(context).textTheme.headline6),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Card(
                          child: ListTile(
                            title: Text('January',  style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold, color: colorPrimaryDark),),
                            trailing: Text('1262' + " kWh", style: const TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold, color: colorPrimaryDark),),
                        ),),
                        Card(child: ListTile(
                          title: Text('Feburary',  style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold, color: colorPrimaryDark),),
                          trailing: Text('1482' + " kWh", style: const TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold, color: colorPrimaryDark), ),
                        ),),
                        Card(
                          child: ListTile(
                            title: Text('March', style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold, color: colorPrimaryDark),),
                            trailing: Text('1654' + " kWh", style: const TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold, color: colorPrimaryDark),),
                        ),),
                        Card(
                          child: ListTile(
                            title: Text('April', style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold, color: colorPrimaryDark),),
                            trailing: Text('1566' + " kWh", style: const TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold, color: colorPrimaryDark),),
                        ),),
                        Card(
                          child: ListTile(
                            title: Text('June', style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold, color: colorPrimaryDark),),
                            trailing: Text('1328' + " kWh", style: const TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold, color: colorPrimaryDark),),
                        ),),
                      ],
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
