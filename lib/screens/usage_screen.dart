import 'package:flutter/material.dart';
import 'package:hmiot/dummy_data.dart';
import 'package:hmiot/widgets/usage_carousel.dart';
import 'package:hmiot/widgets/usage_price_card.dart';

class UsageScreen extends StatelessWidget {
  static const routeName = '/usage';

  // Future<UsagesData> _getUsageDataToday() async {
  //   var data = await CallApi().getDataWithoutToken('dashboardUpdate');
  //   var jsonData = json.decode(data.body);
  //   UsagesData usagesDataToday = UsagesData(
  //       jsonData["device_id"], jsonData["LastRead"], jsonData["last7Days"]);
  //   return usagesDataToday;
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final roomId = routeArgs['id'];
    final roomName = routeArgs['name'];
    final colors = routeArgs['color'];
    final usageData = DUMMY_USAGES.where((usage) {
      return usage.room.contains(roomId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(roomName),
        ),
        body: SingleChildScrollView(
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
                UsageCarousel(
                    usageData[0].id,
                    usageData[0].totalTodayUsed,
                    usageData[0].totalMonthUsed,
                    usageData[0].todayDescription,
                    usageData[0].monthDescription,
                    colors),
                Text("Total Price",
                    style: Theme.of(context).textTheme.headline4),
                UsagePriceCard(usageData[0].totalPrice),
              ],
            ),
          ),
        ));
  }
}
