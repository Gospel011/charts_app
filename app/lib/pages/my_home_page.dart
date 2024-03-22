import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double barWidth = 48;
  double borderRadius = 8;
  double totalBars = 3.0;

  double? defaultData = 30;
  double groupSpace = 10;

  BackgroundBarChartRodData? backDrawRodData =
      BackgroundBarChartRodData(color: Colors.grey.shade200, toY: 100, show: true);

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(x: 10, barRods: [
          BarChartRodData(
              toY: defaultData ?? 0,
              color: Colors.blueGrey.shade200,
              width: barWidth,
              borderRadius: BorderRadius.circular(borderRadius),
              backDrawRodData: backDrawRodData
              ),
        ]),
        BarChartGroupData(x: 10, barRods: [
          BarChartRodData(
              toY: 50,
              color: Colors.blueGrey.shade200,
              width: barWidth,
              borderRadius: BorderRadius.circular(borderRadius),
              backDrawRodData: backDrawRodData
              ),
        ]),
        BarChartGroupData(x: 10, barRods: [
          BarChartRodData(
              toY: 90,
              color: Colors.blueGrey.shade200,
              width: barWidth,
              borderRadius: BorderRadius.circular(borderRadius),
              backDrawRodData: backDrawRodData
              ),
        ]),
        BarChartGroupData(x: 10, barRods: [
          BarChartRodData(
              toY: 100,
              color: Colors.blueGrey.shade200,
              width: barWidth,
              borderRadius: BorderRadius.circular(borderRadius),
              
              
              backDrawRodData: backDrawRodData
              ),
        ]),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SizedBox(
      height: barWidth * barGroups.length + (barGroups.length - 1.0) * groupSpace!,
      // height: 48 * 3 + 20,
      child: RotatedBox(
        quarterTurns: 1,
        child: BarChart(
          BarChartData(
              alignment: BarChartAlignment.spaceBetween,
              groupsSpace: groupSpace,
              maxY: 100,
              minY: 0,
              titlesData: FlTitlesData(show: false),
              borderData: FlBorderData(show: false),
              gridData: FlGridData(show: false),
              barTouchData: BarTouchData(
                  handleBuiltInTouches: false,
                  enabled: true,
                  touchCallback: (touchEvent, touchResponse) {
                    print(touchResponse?.spot?.touchedRodData.toY);

                    defaultData = touchResponse?.spot?.touchedRodData.toY;

                    setState(() {});
                  }),
              barGroups: barGroups),
        ),
      ),
    )));
  }
}
