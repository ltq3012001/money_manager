import 'package:flutter/material.dart';
import 'package:money_manager/screen/home_view/daily_view.dart';
import 'package:money_manager/screen/home_view/monthly_paycheck.dart';
import 'package:money_manager/screen/home_view/monthly_view.dart';

enum ViewType { daily, monthly }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  // ignore: unused_field
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
              flex: 8,
              child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: const [DailyView(), MonthlyView()])),
          TabBar(
              isScrollable: false,
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: const [
                Tab(
                  text: "Daily",
                ),
                Tab(
                  text: "Monthly",
                )
              ]),
          // Expanded(flex: 2, child: MonthlyPaycheck())
        ],
      ),
    );
  }
}
