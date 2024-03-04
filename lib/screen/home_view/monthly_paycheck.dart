import 'package:flutter/material.dart';
import 'package:money_manager/widget/monthly_paycheck_card.dart';

class MonthlyPaycheck extends StatefulWidget {
  MonthlyPaycheck({super.key});

  State<MonthlyPaycheck> createState() => _MonthlyPaycheckState();
}

class _MonthlyPaycheckState extends State<MonthlyPaycheck> {
  _MonthlyPaycheckState();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List<MonthlyPaycheckCard>.generate(
            10, (index) => MonthlyPaycheckCard()),
      ),
    );
  }
}
