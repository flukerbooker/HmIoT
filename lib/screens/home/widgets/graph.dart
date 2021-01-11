import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hmiot/constants.dart';

class UsageGraph extends StatefulWidget {
  @override
  _UsageGraphState createState() => _UsageGraphState();
}

class _UsageGraphState extends State<UsageGraph> {
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
              case 100:
                return '100';
              case 200:
                return '200';
              case 300:
                return '300';
              case 400:
                return '400';
              case 500:
                return '500';
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
      maxY: 500,
      lineBarsData: [
        LineChartBarData(
          spots: [FlSpot(0, 122), FlSpot(8, 256), FlSpot(24, 122)],
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
