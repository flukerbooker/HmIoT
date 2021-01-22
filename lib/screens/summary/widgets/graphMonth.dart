import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hmiot/constants.dart';

class UsageGraphMonth extends StatefulWidget {
  @override
  _UsageGraphMonthState createState() => _UsageGraphMonthState();
}

class _UsageGraphMonthState extends State<UsageGraphMonth> {
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
                return 'Week1';
              case 6:
                return 'Week2';
              case 13:
                return 'Week3';
              case 20:
                return 'Week4';
              case 27:
                return 'Week5';
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
              case 30:
                return '30';
              case 60:
                return '60';
              case 90:
                return '90';
              case 120:
                return '120';
              case 150:
                return '150';
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
      maxX: 27,
      minY: 0,
      maxY: 150,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 93.6),
            FlSpot(3, 74.4),
            FlSpot(7, 81.5),
            FlSpot(11, 96.6),
            FlSpot(15, 101.5),
            FlSpot(19, 88.5),
            FlSpot(23, 71.6),
            FlSpot(27, 86.5),
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
