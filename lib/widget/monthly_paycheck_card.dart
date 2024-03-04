import 'package:flutter/material.dart';

class MonthlyPaycheckCard extends StatelessWidget {
  const MonthlyPaycheckCard({super.key});

  void onPressed() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(4),
        child: Container(
            width: 160,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.8),
                borderRadius: BorderRadius.circular(8),
                color: Colors.blue),
            child: Padding(
                padding: EdgeInsets.only(left: 4, right: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(("22/11")),
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(12)),
                              child:
                                  Text("category", textAlign: TextAlign.start),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(flex: 7, child: Text("Desc")),
                            Expanded(flex: 3, child: Text("9999"))
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: onPressed,
                            icon: const Icon(Icons.add),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateColor.resolveWith((states) {
                                return Colors.white;
                              }),
                            )),
                        IconButton(
                            onPressed: onPressed,
                            icon: const Icon(Icons.remove))
                      ],
                    )
                  ],
                ))));
  }
}
