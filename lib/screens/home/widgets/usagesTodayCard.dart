import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'graph.dart';

class UsagesTodayCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            margin: EdgeInsets.only(
              top: size.height * 0.03,
              left: size.width * 0.04,
            ),
            child: Text("Usage Energy",
                style: Theme.of(context).textTheme.headline4)),
        Container(
          margin: EdgeInsets.only(
            top: size.height * 0.01,
            left: size.width * 0.03,
            right: size.width * 0.03,
          ),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Today's Used",
                        style: Theme.of(context).textTheme.headline5),
                    Container(
                      margin: EdgeInsets.only(right: size.width * 0.05),
                      decoration: BoxDecoration(
                          color: colorPrimaryLight.withOpacity(0.1),
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(40))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "260",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      " kWh",
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 15, top: 5),
                  child: Row(
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
                  )),
              Padding(
                padding: const EdgeInsets.only(
                    top: 30, bottom: 20, right: 40, left: 15),
                child:
                    SizedBox(height: size.height * 0.275, child: UsageGraph()),
              ),
            ],
          ),
        )
      ],
    );
  }
}
