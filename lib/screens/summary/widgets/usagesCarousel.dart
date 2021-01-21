import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:hmiot/constants.dart';
import 'package:hmiot/screens/summary/widgets/usagesMonthCard.dart';
import 'package:hmiot/screens/summary/widgets/usagesTodayCard.dart';

class UsagesCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.52,
      child: CarouselSlider(
        children: [UsagesTodayCard(), UsagesMonthCard()],
        slideTransform: CubeTransform(rotationAngle: 0),
        slideIndicator: CircularSlideIndicator(
          indicatorBackgroundColor: colorGreyLight,
          currentIndicatorColor: colorBlack,
        ),
      ),
    );
  }
}
