import 'package:flutter/foundation.dart';

class TodayUsageGraph {
  final DateTime day;
  final int value;

  TodayUsageGraph({
    @required this.day,
    @required this.value,
  });
}

class MonthUsageGraph {
  final DateTime week;
  final int value;

  MonthUsageGraph({
    @required this.week,
    @required this.value,
  });
}
