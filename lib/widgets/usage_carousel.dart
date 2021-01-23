import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:hmiot/constants.dart';
import '../screens/statistic_screen.dart';
import 'usage_graph.dart';

class UsagesCarousel extends StatelessWidget {
  Widget buildUsageCard(BuildContext context, String title, String usage,
      String description, Widget graph) {
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
                                  new Statistic("Statistic")));
                        },
                        child: Row(
                          children: [
                            Text(
                              "Details",
                              style: TextStyle(
                                  fontSize: 16, color: colorPrimaryLight),
                            ),
                            Icon(
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
                      usage,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      " kWh",
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.offline_bolt,
                      color: colorGreyLight,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      description,
                      style: TextStyle(color: colorGreyLight),
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
          buildUsageCard(context, "Today's Used", "93.6", "+2% than yesterday",
              UsageGraph('Today')),
          buildUsageCard(context, "Monthly Used", "2808", "+6% than last month",
              UsageGraph('Month'))
        ],
        slideTransform: CubeTransform(rotationAngle: 0),
        slideIndicator: CircularSlideIndicator(
          indicatorBackgroundColor: colorGreyLight,
          currentIndicatorColor: colorBlack,
        ),
      ),
    );
  }
}
