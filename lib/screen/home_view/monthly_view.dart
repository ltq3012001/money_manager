// dart packages
import 'dart:convert';
// flutter packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:money_manager/widget/monthly_view_transaction_card.dart';

class MonthlyView extends StatefulWidget {
  const MonthlyView({super.key});

  @override
  State<MonthlyView> createState() => _MonthlyViewState();
}

class _MonthlyViewState extends State<MonthlyView> {
  late final PageController pageController;

  int currentYear = DateTime.now().year;

  Map transactionData = {};

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/sample_data.json');
    final data = await jsonDecode(response);
    transactionData = data;
  }

  @override
  void initState() {
    pageController = PageController(initialPage: 1, keepPage: false);
    super.initState();
  }

  MonthlyViewTransactionCard buildPage(int year) {
    return MonthlyViewTransactionCard(
      data: transactionData[year.toString()],
    );
  }

  List<MonthlyViewTransactionCard> buildCurrentView() {
    List<MonthlyViewTransactionCard> viewList = List.empty(growable: true);
    for (int i = currentYear - 1; i < currentYear + 2; i++) {
      viewList.add(buildPage(i));
    }
    return viewList;
  }

  void onGoToLastYear() {
    setState(() {
      currentYear--;
    });
  }

  void onGoToNextYear() {
    setState(() {
      currentYear++;
    });
  }

  void onPageChanged(int index) {
    if (index < 1) {
      onGoToLastYear();
      pageController.jumpToPage(1);
    } else if (index > 1) {
      onGoToNextYear();
      pageController.jumpToPage(1);
    }
  }

  void onGoLastYearButtonPressed() {
    pageController.previousPage(
        duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  void onGoNextYearButtonPressed() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: readJson(),
        builder: (context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: onGoLastYearButtonPressed,
                        icon: const Icon(Icons.arrow_back_ios_new)),
                    Text(currentYear.toString()),
                    IconButton(
                        onPressed: onGoNextYearButtonPressed,
                        icon: const Icon(Icons.arrow_forward_ios))
                  ],
                ),
                Expanded(
                    child: Container(
                        color: const Color(0xFFe8e8e8),
                        child: PageView(
                          controller: pageController,
                          onPageChanged: onPageChanged,
                          children: buildCurrentView(),
                        )))
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            return const Column(
              children: [Text("Error !")],
            );
          }
        });
  }
}
