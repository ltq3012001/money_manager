import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();

}

class _ChartScreenState extends State<ChartScreen>
{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: PieChart(
        PieChartData(
          borderData: FlBorderData(
            show: false,
          ),
          sectionsSpace: 0,
          centerSpaceRadius: 0,
          sections:[
            PieChartSectionData(
              color: Colors.red,
              value: 30, 
              title: "text")],)));
  }
}
