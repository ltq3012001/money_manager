import 'package:flutter/material.dart';
import 'package:money_manager/utils/constant.dart';

class MonthlyViewTransactionCard extends StatelessWidget {
  final dynamic data;
  const MonthlyViewTransactionCard({super.key, required this.data});

  void onPressed() {
    print("pressed");
  }

  TextButton buildTransaction(int monthInt, num incomeValue, num expenseValue) {
    return TextButton(
        style: TextButton.styleFrom(
            minimumSize: const Size(100, 60),
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
                side: const BorderSide(color: Color(0xFFe8e8e8)))),
        onPressed: onPressed,
        child: Row(
          children: [
            Expanded(flex: 4, child: Text(month[monthInt])),
            Expanded(
                flex: 3,
                child: Text(
                  incomeValue.toString(),
                  textAlign: TextAlign.end,
                  style: const TextStyle(color: Colors.blue),
                )),
            Expanded(
              flex: 3,
              child: Text(expenseValue.toString(),
                  textAlign: TextAlign.end,
                  style: const TextStyle(color: Colors.red)),
            ),
          ],
        ));
  }

  List<TextButton> buildTransactionList() {
    List<TextButton> viewList = List.empty(growable: true);
    for (int i = 0; i < 12; i++) {
      num incomeValue = 0;
      num expenseValue = 0;
      if (data != null && data[i.toString()] != null) {
        data[i.toString()].forEach((key, value) {
          value.forEach((transactions) {
            if (transactions["type"] == "Income") {
              incomeValue += transactions["value"]!;
            } else {
              expenseValue += transactions["value"]!;
            }
          });
        });
      }
      viewList.add(buildTransaction(i, incomeValue, expenseValue));
    }
    return viewList;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: buildTransactionList(),
    ));
  }
}
