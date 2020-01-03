import 'package:flutter/material.dart';
import 'package:lunch_lottery/components/bottom_navigation_view.dart';
import 'package:lunch_lottery/components/lottery_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '昼飯決めるアプリ',
      home: Scaffold(
        body: LotteryView(),
        bottomNavigationBar: BottomNavigationView(),
      ),
    );
  }
}
