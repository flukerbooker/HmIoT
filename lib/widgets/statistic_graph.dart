import '../models/statistic.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class StatisticGraph extends StatelessWidget {
  final List<Statistic> statistic;

  StatisticGraph({@required this.statistic});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Statistic, DateTime>> series = [
      charts.Series(
          id: "Statistic",
          data: statistic,
          domainFn: (Statistic series, _) => series.month,
          measureFn: (Statistic series, _) => series.value,
          labelAccessorFn: (Statistic series, _) =>
              '${series.value.toString()}')
    ];
    return charts.TimeSeriesChart(
      series,
      defaultRenderer: new charts.BarRendererConfig<DateTime>(
        barRendererDecorator: new charts.BarLabelDecorator<DateTime>(),
      ),
    );
  }
}
