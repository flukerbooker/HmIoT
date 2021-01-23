import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hmiot/models/api.dart';
import 'package:hmiot/models/usagesData.dart';
import 'package:hmiot/widgets/usage_price_card.dart';
import 'package:hmiot/widgets/usage_carousel.dart';

class Usages extends StatelessWidget {
  Future<UsagesData> _getUsageDataToday() async {
    var data = await CallApi().getDataWithoutToken('dashboardUpdate');
    var jsonData = json.decode(data.body);
    UsagesData usagesDataToday = UsagesData(
        jsonData["device_id"], jsonData["LastRead"], jsonData["last7Days"]);
    return usagesDataToday;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: _getUsageDataToday(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(
                    top: size.height * 0.03,
                    left: size.width * 0.04,
                    right: size.width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Energy Usage",
                        style: Theme.of(context).textTheme.headline4),
                    UsagesCarousel(),
                    Text("Total Price",
                        style: Theme.of(context).textTheme.headline4),
                    TotalPriceCard(),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: Text("ERROR404"),
            );
          }
        });
  }
}
