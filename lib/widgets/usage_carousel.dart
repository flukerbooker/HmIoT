import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:hmiot/constants.dart';
import 'package:hmiot/models/usageGraph.dart';
import '../screens/statistic_screen.dart';
import 'package:intl/intl.dart';
import 'usage_graph.dart';

class UsageCarousel extends StatelessWidget {
  final String usageId;
  final int totalTodayUsage;
  final int totalMonthUsage;
  final String todayDescription;
  final String monthDescription;
  final Color colors;

  UsageCarousel(this.usageId, this.totalTodayUsage, this.totalMonthUsage,
      this.todayDescription, this.monthDescription, this.colors);

  Widget buildUsageCard(BuildContext context, String title, int usage,
      String description, Color colors, Widget graph) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: EdgeInsets.only(top: size.height * 0.02),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 3))
              ]),
          child: Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.02,
                bottom: size.height * 0.02,
                left: size.width * 0.04,
                right: size.width * 0.08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title, style: Theme.of(context).textTheme.headline5),
                      FlatButton(
                        padding: EdgeInsets.zero,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onPressed: () {
                          Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  new StatisticScreen()));
                        },
                        child: Row(
                          children: [
                            const Text(
                              "Details",
                              style: TextStyle(
                                  fontSize: 16, color: colorPrimaryLight),
                            ),
                            const Icon(
                              Icons.arrow_forward,
                              color: colorPrimaryLight,
                              size: 18,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      usage.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const Text(
                      " kWh",
                      style: const TextStyle(fontSize: 16),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.offline_bolt,
                      color: colors,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      description,
                      style: TextStyle(color: colors),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.03),
                  child: SizedBox(height: size.height * 0.275, child: graph),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    DateTime now = DateTime.now();
    String today = DateFormat('yyyy-MM-dd').format(now);
    return Container(
      height: size.height * 0.52,
      child: CarouselSlider(
        children: [
          buildUsageCard(
              context,
              "Today's Used",
              totalTodayUsage,
              todayDescription,
              colors,
              TodayUsageGraphWidget(
                todayUsageGraph: [
                  TodayUsageGraph(
                      day: DateTime.parse(today).subtract(Duration(days: 2)),
                      value: 84),
                  TodayUsageGraph(
                      day: DateTime.parse(today).subtract(Duration(days: 1)),
                      value: 76),
                  TodayUsageGraph(day: DateTime.parse(today), value: 78),
                ],
              )),
          buildUsageCard(
              context,
              "Monthly Used",
              totalMonthUsage,
              monthDescription,
              colors,
              MonthUsageGraphWidget(
                monthUsageGraph: [
                  MonthUsageGraph(
                      week: DateTime.parse(today).subtract(Duration(days: 21)),
                      value: 411),
                  MonthUsageGraph(
                      week: DateTime.parse(today).subtract(Duration(days: 14)),
                      value: 291),
                  MonthUsageGraph(
                      week: DateTime.parse(today).subtract(Duration(days: 7)),
                      value: 362),
                  MonthUsageGraph(week: DateTime.parse(today), value: 324),
                ],
              ))
        ],
        slideTransform: const CubeTransform(rotationAngle: 0),
        slideIndicator: CircularSlideIndicator(
          indicatorBackgroundColor: colorGreyLight,
          currentIndicatorColor: colorBlack,
        ),
      ),
    );
  }
}
