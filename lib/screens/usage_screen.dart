import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hmiot/models/api.dart';
import 'package:hmiot/models/usage.dart';
import 'package:hmiot/widgets/usage_carousel.dart';
import 'package:hmiot/widgets/usage_price_card.dart';
import '../constants.dart';

class UsageScreen extends StatelessWidget {
  static const routeName = '/usage';

  Future<UsageData> _getUsageData(BuildContext context) async {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<dynamic, dynamic>;
    final roomId = routeArgs['id'];
    var usageData =
        await CallApi().getDataWithToken('dashboardUpdate?id=$roomId');
    var data = json.decode(usageData.body);

    UsageData usagesData = UsageData(
        id: data['device_id'],
        todayDescription: data['last7Days'].last['change'],
        monthDescription: data['thisYear'].last['change'],
        totalTodayUsed: data['last7Days'].last['value'],
        totalMonthUsed: data['thisYear'].last['value'],
        totalPrice: data['thisYear'].last['price'],
        days: data['last7Days'],
        weeks: data['last4weeks'],
        months: data['thisYear']);
    return usagesData;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<dynamic, dynamic>;
    final roomName = routeArgs['name'];
    return Scaffold(
        appBar: AppBar(
          title: Text(roomName),
        ),
        body: FutureBuilder(
          future: _getUsageData(context),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
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
                        snapshot.data.id,
                        snapshot.data.totalTodayUsed,
                        snapshot.data.totalMonthUsed,
                        snapshot.data.todayDescription,
                        snapshot.data.monthDescription,
                        snapshot.data.days,
                        snapshot.data.weeks,
                        snapshot.data.months,
                        [colorOrangeRed, colorGreen]),
                    Text("Total Price",
                        style: Theme.of(context).textTheme.headline4),
                    UsagePriceCard(snapshot.data.totalPrice),
                  ],
                ),
              );
            }
          },
        ));
  }
}
