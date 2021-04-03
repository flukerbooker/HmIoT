import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:hmiot/constants.dart';
import 'package:hmiot/models/usageGraph.dart';
import 'package:hmiot/screens/statistic_screen.dart';
import 'usage_graph.dart';

class UsageCarousel extends StatelessWidget {
  final String usageId;
  final int totalTodayUsage;
  final int totalMonthUsage;
  final String todayDescription;
  final String monthDescription;
  final List<dynamic> day;
  final List<dynamic> week;
  final List<dynamic> month;
  final Color colors;

  UsageCarousel(
      this.usageId,
      this.totalTodayUsage,
      this.totalMonthUsage,
      this.todayDescription,
      this.monthDescription,
      this.day,
      this.week,
      this.month,
      this.colors);

  void selectStatistic(BuildContext context) {
    Navigator.of(context).pushNamed(StatisticScreen.routeName, arguments: {
      'month': month,
      'value': month,
    });
  }

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
                        onPressed: () => selectStatistic(context),
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
                      day: DateTime.parse(day[7]['date'])
                          .subtract(Duration(days: 2)),
                      value: day[5]['value']),
                  TodayUsageGraph(
                      day: DateTime.parse(day[7]['date'])
                          .subtract(Duration(days: 1)),
                      value: day[6]['value']),
                  TodayUsageGraph(
                      day: DateTime.parse(day[7]['date']),
                      value: day[7]['value']),
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
                      week: DateTime.parse(week[0]['date']),
                      value: week[0]['value']),
                  MonthUsageGraph(
                      week: DateTime.parse(week[1]['date']),
                      value: week[1]['value']),
                  MonthUsageGraph(
                      week: DateTime.parse(week[2]['date']),
                      value: week[2]['value']),
                  MonthUsageGraph(
                      week: DateTime.parse(week[3]['date']),
                      value: week[3]['value']),
                  MonthUsageGraph(
                      week: DateTime.parse(week[4]['date']),
                      value: week[4]['value']),
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
