import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hmiot/constants.dart';

class UsagePriceCard extends StatelessWidget {
  final String totalPrice;

  UsagePriceCard(this.totalPrice);

  @override
  Widget build(BuildContext context) {
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
            padding: EdgeInsets.symmetric(
                vertical: size.height * 0.0275, horizontal: size.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Price",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.005),
                  child: Row(
                    children: [
                      Container(
                          child: SvgPicture.asset(
                        'assets/images/thailand-baht.svg',
                        height: size.height * 0.05,
                        color: colorPrimaryLight,
                      )),
                      Container(
                        margin: EdgeInsets.only(left: size.width * 0.05),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              totalPrice + ' Baht',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            const Text('You could save it by adjust the energy',
                                style: TextStyle(color: colorGreyLight))
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
