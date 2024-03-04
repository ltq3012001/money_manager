import 'package:flutter/material.dart';

// screens
import 'package:money_manager/screen/chart_screen.dart';
import 'package:money_manager/screen/home_screen.dart';
import 'package:money_manager/screen/more_screen.dart';
import 'package:money_manager/screen/wallets_screen.dart';
// utils
import 'package:money_manager/utils/constant.dart';

class MainScreenHost extends StatefulWidget {
  const MainScreenHost({super.key});

  @override
  State<MainScreenHost> createState() => _MainScreenHostState();
}

class _MainScreenHostState extends State<MainScreenHost> {
  var currentIndex = 0;

  Widget buildScreenContent(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const ChartScreen();
      case 2:
        return const WalletsScreen();
      case 3:
        return const MoreScreen();
      default:
        return const HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildScreenContent(currentIndex),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: secondaryDark,
          onPressed: (() => {}),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          selectedItemColor: secondaryDark,
          unselectedItemColor: fontLight,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.equalizer), label: "Chart"),
            BottomNavigationBarItem(icon: Icon(Icons.wallet), label: "Wallet"),
            BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz), label: "More"),
          ]),
    );
  }
}
