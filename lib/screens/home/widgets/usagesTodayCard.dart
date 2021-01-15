import 'package:flutter/material.dart';
import 'package:hmiot/screens/statistics/statistics.dart';

import '../../../constants.dart';
import 'graph.dart';

class UsagesTodayCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
          top: size.height * 0.03,
          left: size.width * 0.04,
          right: size.width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Usage Energy", style: Theme.of(context).textTheme.headline4),
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
                        Text("Today's Used",
                            style: Theme.of(context).textTheme.headline5),
                        FlatButton(
                          padding: EdgeInsets.zero,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
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
                        "260",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        " kWh",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: size.width * 0.01),
                        child: Icon(
                          Icons.offline_bolt,
                          color: colorGreyLight,
                        ),
                      ),
                      Text(
                        "+17% than yesterday",
                        style: TextStyle(color: colorGreyLight),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.03),
                    child: SizedBox(
                        height: size.height * 0.275, child: UsageGraph()),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
