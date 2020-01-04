import 'package:flutter/material.dart';
import 'package:lunch_lottery/lottery_app.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '昼飯決めるアプリ',
      home: LotteryApp(),
    );
  }
}
