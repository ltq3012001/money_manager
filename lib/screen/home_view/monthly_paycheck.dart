import 'package:flutter/material.dart';

class MonthlyPaycheck extends StatefulWidget {
  MonthlyPaycheck({super.key});

  State<MonthlyPaycheck> createState() => _MonthlyPaycheckState();
}

class _MonthlyPaycheckState extends State<MonthlyPaycheck> {
  _MonthlyPaycheckState();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Row(
        children: List<Column>.generate(
            50, (index) => Column(children: [Text(index.toString())])),
      ),
    );
  }
}
