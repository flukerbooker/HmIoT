import 'package:flutter/material.dart';
import 'package:hmiot/widgets/statistic_graph_container.dart';
import '../constants.dart';

class StatisticScreen extends StatelessWidget {
  static const routeName = '/usage/statistic';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<dynamic, dynamic>;
    final month = routeArgs['month'];
    final value = routeArgs['value'];

    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text("Total Usage by month",
                    style: Theme.of(context).textTheme.headline6),
              ),
            ),
            StatisticGraphContainer(month: month, value: value),
            Container(
              height: 350,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Month",
                            style: Theme.of(context).textTheme.headline6),
                        Text("Total Usage",
                            style: Theme.of(context).textTheme.headline6),
                      ],
                    ),
                  ),
                  Expanded(
                      child: ListView(
                    children: [
                      Card(
                        child: ListTile(
                          title: Text(
                            'January',
                            style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: colorPrimaryDark),
                          ),
                          trailing: Text(
                            '1262' + " kWh",
                            style: const TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: colorPrimaryDark),
                          ),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text(
                            'Feburary',
                            style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: colorPrimaryDark),
                          ),
                          trailing: Text(
                            '1482' + " kWh",
                            style: const TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: colorPrimaryDark),
                          ),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text(
                            'March',
                            style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: colorPrimaryDark),
                          ),
                          trailing: Text(
                            '1654' + " kWh",
                            style: const TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: colorPrimaryDark),
                          ),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text(
                            'April',
                            style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: colorPrimaryDark),
                          ),
                          trailing: Text(
                            '1566' + " kWh",
                            style: const TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: colorPrimaryDark),
                          ),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text(
                            'June',
                            style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: colorPrimaryDark),
                          ),
                          trailing: Text(
                            '1328' + " kWh",
                            style: const TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: colorPrimaryDark),
                          ),
                        ),
                      ),
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
