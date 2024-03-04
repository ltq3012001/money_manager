// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps
// dart packages
import 'dart:convert';
// flutter packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:money_manager/widget/daily_view_transaction_card.dart';
import 'package:money_manager/utils/constant.dart';

class DailyView extends StatefulWidget {
  const DailyView({super.key});

  @override
  State<DailyView> createState() => _DailyViewState();
}

class _DailyViewState extends State<DailyView> {
  late final PageController pageController;

  int currentMonth = DateTime.now().month;
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

  List<DailyViewTransactionCard> buildTransaction(
      Map? currentMonthData, int month) {
    List<DailyViewTransactionCard> transactionList = List.empty(growable: true);
    currentMonthData?.forEach((date, transaction) {
      transactionList.add(DailyViewTransactionCard(
          date: "${date}-${month}", data: transaction));
    });
    return transactionList;
  }

  SingleChildScrollView buildPage(int month, int year) {
    return SingleChildScrollView(
      child: Column(
        children: buildTransaction(
            transactionData[year.toString()][month.toString()], month),
      ),
    );
  }

  List<SingleChildScrollView> buildCurrentView() {
    List<SingleChildScrollView> list = List.empty(growable: true);
    for (int i = currentMonth - 1; i < currentMonth + 2; i++) {
      int month = 0;
      int year = currentYear;
      if (i < 1) {
        month = i + 12;
        year--;
      } else if (i > 12) {
        month = i - 12;
        year++;
      } else {
        month = i;
      }
      list.add(buildPage(month, year));
    }
    return list;
  }

  void onGoToLastMonth() {
    setState(() {
      if (currentMonth == 1) {
        currentMonth += 11;
        currentYear--;
      } else {
        currentMonth--;
      }
      //viewList = buildCurrentView();
    });
  }

  void onGoToNextMonth() {
    setState(() {
      if (currentMonth == 12) {
        currentMonth -= 11;
        currentYear++;
      } else {
        currentMonth++;
      }
      //viewList = buildCurrentView();
    });
  }

  void onPageChanged(int index) {
    if (index < 1) {
      onGoToLastMonth();
      pageController.jumpToPage(1);
    } else if (index > 1) {
      onGoToNextMonth();
      pageController.jumpToPage(1);
    }
  }

  void onGoLastMonthButtonPressed() {
    pageController.previousPage(
        duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  void onGoNextMonthButtonPressed() {
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
                        onPressed: onGoLastMonthButtonPressed,
                        icon: const Icon(Icons.arrow_back_ios_new)),
                    Text("${month[currentMonth - 1]} - ${currentYear}"),
                    IconButton(
                        onPressed: onGoNextMonthButtonPressed,
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
