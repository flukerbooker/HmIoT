import 'package:flutter/foundation.dart';

class UsageData {
  final int id;
  final String todayDescription;
  final String monthDescription;
  final int totalTodayUsed;
  final int totalMonthUsed;
  final int totalPrice;
  final List<dynamic> days;
  final List<dynamic> weeks;
  final List<dynamic> months;

  UsageData(
      {@required this.id,
      @required this.todayDescription,
      @required this.monthDescription,
      @required this.totalTodayUsed,
      @required this.totalMonthUsed,
      @required this.totalPrice,
      @required this.days,
      @required this.weeks,
      @required this.months});
}
