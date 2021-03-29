import '../models/usageGraph.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class TodayUsageGraphWidget extends StatelessWidget {
  final List<TodayUsageGraph> todayUsageGraph;
  TodayUsageGraphWidget({@required this.todayUsageGraph});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<TodayUsageGraph, DateTime>> series = [
      charts.Series(
          id: "TodayUsageGraph",
          data: todayUsageGraph,
          domainFn: (TodayUsageGraph series, _) => series.day,
          measureFn: (TodayUsageGraph series, _) => series.value)
    ];
    return charts.TimeSeriesChart(series,
        defaultRenderer: new charts.BarRendererConfig<DateTime>());
  }
}

class MonthUsageGraphWidget extends StatelessWidget {
  final List<MonthUsageGraph> monthUsageGraph;
  MonthUsageGraphWidget({@required this.monthUsageGraph});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<MonthUsageGraph, DateTime>> series = [
      charts.Series(
          id: "MonthUsageGraph",
          data: monthUsageGraph,
          domainFn: (MonthUsageGraph series, _) => series.week,
          measureFn: (MonthUsageGraph series, _) => series.value)
    ];
    return charts.TimeSeriesChart(
      series,
      defaultRenderer: new charts.BarRendererConfig<DateTime>(),
    );
  }
}
