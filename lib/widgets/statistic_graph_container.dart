import 'package:flutter/cupertino.dart';
import 'package:hmiot/models/statistic.dart';
import 'package:hmiot/widgets/statistic_graph.dart';

class StatisticGraphContainer extends StatelessWidget {
  final List<dynamic> month;
  final List<dynamic> value;

  StatisticGraphContainer({@required this.month, @required this.value});

  @override
  Widget build(BuildContext context) {
    final List<Statistic> statistic = [
      Statistic(
          value: month[10]['value'], month: DateTime.parse(month[10]['date'])),
      Statistic(
          value: month[11]['value'], month: DateTime.parse(month[11]['date'])),
      Statistic(
          value: month[12]['value'], month: DateTime.parse(month[12]['date'])),
    ];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      height: 300,
      child: StatisticGraph(statistic: statistic),
    );
  }
}
