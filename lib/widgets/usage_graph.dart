import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hmiot/constants.dart';

class UsageGraph extends StatefulWidget {
  final String type;
  final Map<int, double> graphToday;

  UsageGraph(this.type, this.graphToday);

  @override
  _UsageGraphState createState() => _UsageGraphState();
}

class _UsageGraphState extends State<UsageGraph> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  bool showAvg = false;

  Widget buildGraph(Function bottomTitle, Function sideTitle, List<FlSpot> data,
      double minX, double maxX, double minY, double maxY) {
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
            getTitles: bottomTitle),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: colorGreyLight,
            fontSize: 15,
          ),
          getTitles: sideTitle,
          reservedSize: 28,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: minX,
      maxX: maxX,
      minY: minY,
      maxY: maxY,
      lineBarsData: [
        LineChartBarData(
          spots: data,
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

  @override
  Widget build(BuildContext context) {
    if (widget.type == 'Today') {
      return buildGraph((value) {
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
      }, (value) {
        switch (value.toInt()) {
          case 3:
            return '3';
          case 6:
            return '6';
          case 9:
            return '9';
          case 12:
            return '12';
          case 15:
            return '15';
        }
        return '';
      }, [
        FlSpot(0, widget.graphToday[0]),
        FlSpot(1, widget.graphToday[1]),
        FlSpot(2, widget.graphToday[2]),
        FlSpot(3, widget.graphToday[3]),
        FlSpot(4, widget.graphToday[4]),
        FlSpot(5, widget.graphToday[5]),
        FlSpot(6, widget.graphToday[6]),
        FlSpot(7, widget.graphToday[7]),
        FlSpot(8, widget.graphToday[8]),
        FlSpot(9, widget.graphToday[9]),
        FlSpot(10, widget.graphToday[10]),
        FlSpot(11, widget.graphToday[11]),
        FlSpot(12, widget.graphToday[12]),
        FlSpot(13, widget.graphToday[13]),
        FlSpot(14, widget.graphToday[14]),
        FlSpot(15, widget.graphToday[15]),
        FlSpot(16, widget.graphToday[16]),
        FlSpot(17, widget.graphToday[17]),
        FlSpot(18, widget.graphToday[18]),
        FlSpot(19, widget.graphToday[19]),
        FlSpot(20, widget.graphToday[20]),
        FlSpot(21, widget.graphToday[21]),
        FlSpot(22, widget.graphToday[22]),
        FlSpot(23, widget.graphToday[23]),
        FlSpot(24, widget.graphToday[24])
      ], 0, 24, 0, 15);
    }
    if (widget.type == 'Month') {
      return buildGraph((value) {
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
      }, (value) {
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
      }, [
        FlSpot(0, 93.6),
        FlSpot(3, 74.4),
        FlSpot(7, 81.5),
        FlSpot(11, 96.6),
        FlSpot(15, 101.5),
        FlSpot(19, 88.5),
        FlSpot(23, 71.6),
        FlSpot(27, 86.5),
      ], 0, 27, 0, 150);
    } else {
      return const Center(child: const Text('Not have graph yet'));
    }
  }
}
