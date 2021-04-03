import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hmiot/dummy_data.dart';
import 'package:hmiot/models/api.dart';
import 'package:hmiot/models/usage.dart';
import 'package:hmiot/widgets/usage_carousel.dart';
import 'package:hmiot/widgets/usage_price_card.dart';
import 'package:intl/intl.dart';

class UsageScreen extends StatelessWidget {
  static const routeName = '/usage';

  Future<UsageData> _getUsageDataToday(BuildContext context) async {
    DateTime now = DateTime.now();
    String today = DateFormat('yyyy-MM-dd').format(now);
    // print(today);
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<dynamic, dynamic>;
    final roomId = routeArgs['id'];
    // print(roomId);
    var data = await CallApi()
        .getDataWithToken('auth/getUsage?type=day&date=$today&id=$roomId');
    var jsonData = json.decode(data.body);
    // print(jsonData);
    UsageData usagesDataToday = UsageData(
      id: jsonData['device_id'],
      room: null,
      todayDescription: '',
      monthDescription: '',
      totalTodayUsed: jsonData['results']['value'],
      totalMonthUsed: null,
      totalPrice: jsonData['results']['price'],
      weeks: null,
      days: null,
    );
    return usagesDataToday;
  }

  Future _getUsageGraphToday(BuildContext context) async {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<dynamic, dynamic>;
    final roomId = routeArgs['id'];
    var data = await CallApi().getDataWithToken('dashboardUpdate?id=$roomId');
    var jsonData = json.decode(data.body);
    //print(jsonData);
    return jsonData;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<dynamic, dynamic>;
    final roomId = routeArgs['id'];
    final roomName = routeArgs['name'];
    final todayDescription = routeArgs['description'];
    final colors = routeArgs['color'];
    final usageData = dummyData.where((usage) {
      return usage.room.id == roomId ? true : false;
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(roomName),
        ),
        body: FutureBuilder(
          future: Future.wait(
              [_getUsageDataToday(context), _getUsageGraphToday(context)]),
          builder:
              (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              List<dynamic> usage = snapshot.data;
              return Container(
                margin: EdgeInsets.only(
                    top: size.height * 0.03,
                    left: size.width * 0.04,
                    right: size.width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Energy Usage",
                        style: Theme.of(context).textTheme.headline4),
                    UsageCarousel(
                        usage[0].id,
                        usage[0].totalTodayUsed,
                        usage[1]['thisYear'][12]['value'],
                        '$todayDescription% than yesterday',
                        usageData[0].monthDescription,
                        usage[1]['last7Days'],
                        usage[1]['last4weeks'],
                        usage[1]['thisYear'],
                        colors),
                    Text("Total Price",
                        style: Theme.of(context).textTheme.headline4),
                    UsagePriceCard(usage[0].totalPrice),
                  ],
                ),
              );
            }
          },
        ));
  }
}
