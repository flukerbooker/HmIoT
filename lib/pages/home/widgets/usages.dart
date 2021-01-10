import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hmiot/constants.dart';
import 'package:hmiot/models/api.dart';
import 'package:hmiot/models/usagesData.dart';

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
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Center(child: Text("Loading Data...")),
            );
          }
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 25, left: 15, right: 15),
                    child: Text(
                      "Today's used",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    )),
                Container(
                  height: size.height * 0.2,
                  child: Card(
                    color: colorGreen,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(
                          'Usage Data',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 10, left: 15, right: 15),
                    child: Text(
                      "Monthly used",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    )),
                Container(
                  height: size.height * 0.2,
                  child: Card(
                    color: colorYellow,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(
                          'Usage Data',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 10, left: 15, right: 15),
                    child: Text(
                      "Total Price",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    )),
                Container(
                  height: size.height * 0.2,
                  child: Card(
                    color: colorOrangeRed,
                    margin: EdgeInsets.only(top: 10, left: 15, right: 15),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(
                          'Usage Data',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        });
  }
}
