import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hmiot/constants.dart';

class UsageGraphToday extends StatefulWidget {
  @override
  _UsageGraphTodayState createState() => _UsageGraphTodayState();
}

class _UsageGraphTodayState extends State<UsageGraphToday> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  bool showAvg = false;
  @override
  Widget build(BuildContext context) {
    return LineChart(LineChartData(
      gridData: FlGridData(
        show: false,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) =>
              const TextStyle(color: colorGreyLight, fontSize: 15),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '06:00';
              case 6:
                return '12:00';
              case 12:
                return '18:00';
              case 18:
                return '24:00';
              case 24:
                return '06:00';
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: colorGreyLight,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '1';
              case 2:
                return '2';
              case 3:
                return '3';
              case 4:
                return '4';
              case 5:
                return '5';
            }
            return '';
          },
          reservedSize: 28,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 24,
      minY: 0,
      maxY: 5,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3.25),
            FlSpot(3, 1.26),
            FlSpot(6, 4.4),
            FlSpot(9, 1.21),
            FlSpot(12, 1.26),
            FlSpot(15, 1.22),
            FlSpot(18, 3.34),
            FlSpot(21, 1.22),
            FlSpot(24, 1.17)
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 3,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    ));
  }
}
