import 'package:flutter/material.dart';

class DailyViewTransactionCard extends StatelessWidget {
  final String date;
  final dynamic data;
  const DailyViewTransactionCard(
      {super.key, required this.date, required this.data});

  void onPressed() {
    print("pressed");
  }

  TextButton buildTransaction(var data) {
    return TextButton(
        style: TextButton.styleFrom(
            minimumSize: const Size(100, 60),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
                side: const BorderSide(color: Color(0xFFe8e8e8)))),
        onPressed: onPressed,
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Text(
                  data["type"],
                  style: TextStyle(
                      color:
                          data["type"] == "Expense" ? Colors.red : Colors.blue),
                )),
            Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data["note"],
                      textAlign: TextAlign.start,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(12)),
                      child: Text(data["category"], textAlign: TextAlign.start),
                    )
                  ],
                )),
            Expanded(
                flex: 4,
                child: Text(
                  data["value"].toString(),
                  textAlign: TextAlign.end,
                )),
          ],
        ));
  }

  List<TextButton> buildTransactionList() {
    List<TextButton> transactionsList = List<TextButton>.empty(growable: true);
    for (int i = 0; i < data.length; i++) {
      transactionsList.add(buildTransaction(data[i]));
    }
    return transactionsList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(date),
        ),
        Column(children: buildTransactionList())
      ],
    );
  }
}
