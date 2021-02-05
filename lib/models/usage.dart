import 'package:flutter/foundation.dart';
import 'package:hmiot/models/room.dart';

class UsageData {
  final int id;
  final Room room;
  final String todayDescription;
  final String monthDescription;
  final String totalTodayUsed;
  final String totalMonthUsed;
  final String totalPrice;
  final Map<String, dynamic> weeks;
  final Map<int, double> days;

  UsageData(
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
