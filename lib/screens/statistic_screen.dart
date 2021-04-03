import 'package:flutter/material.dart';
import 'package:hmiot/widgets/statistic_graph_container.dart';
import 'package:hmiot/widgets/statistic_usage.dart';

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
            StatisticUsage(month: month, value: value)
          ],
        ),
      ),
    );
  }
}
