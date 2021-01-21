import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hmiot/models/api.dart';
import 'package:hmiot/models/usagesData.dart';
import 'package:hmiot/screens/summary/widgets/totalPriceCard.dart';
import 'package:hmiot/screens/summary/widgets/usagesCarousel.dart';

class Usages extends StatelessWidget {
  Future<UsagesData> _getUsageDataToday() async {
    var data = await CallApi().getDataWithoutToken('dashboardUpdate');
    var jsonData = json.decode(data.body);
    UsagesData usagesDataToday = UsagesData(
        jsonData["device_id"], jsonData["LastRead"], jsonData["last7Days"]);
    print(usagesDataToday.id);
    print(usagesDataToday.lastRead);
    print(usagesDataToday.last7Days);
    return usagesDataToday;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: _getUsageDataToday(),
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Center(child: Text("Loading Data...")),
            );
          }
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: Text("Usage Energy",
                        style: Theme.of(context).textTheme.headline4),
                    margin: EdgeInsets.only(
                        top: size.height * 0.03,
                        left: size.width * 0.04,
                        right: size.width * 0.04),
                  ),
                  UsagesCarousel(),
                  TotalPriceCard(),
                  // EnergyManagementCard()
                ],
              ),
            );
          }
        });
  }
}
