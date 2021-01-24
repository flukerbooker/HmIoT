import 'package:flutter/foundation.dart';

class UsageData {
  final String id;
  final String room;
  final String todayDescription;
  final String monthDescription;
  final String totalTodayUsed;
  final String totalMonthUsed;
  final String totalPrice;
  final Map<String, dynamic> weeks;
  final Map<String, dynamic> days;

  const UsageData(
      {@required this.id,
      @required this.room,
      @required this.todayDescription,
      @required this.monthDescription,
      @required this.totalTodayUsed,
      @required this.totalMonthUsed,
      @required this.totalPrice,
      @required this.weeks,
      @required this.days});
}
