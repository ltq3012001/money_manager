import 'package:flutter/material.dart';
import 'package:money_manager/screen/main_screen_host.dart';
import 'package:money_manager/utils/data_manager.dart';

void main() {
  runApp(const MyApp());
}

class DataManger {}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: FutureBuilder(
            builder: (context, AsyncSnapshot<void> snapshot) {
              return const MainScreenHost();
            },
            future: DataManager().loadData()));
  }
}
