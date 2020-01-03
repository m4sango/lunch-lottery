import 'package:flutter/material.dart';
import 'package:lunch_lottery/components/ranking_page.dart';
import 'package:lunch_lottery/components/shop_list_page.dart';
import 'package:lunch_lottery/resources/colors.dart';

import 'components/lottery_page.dart';
import 'components/parts/bottom_navigation_view.dart';

class LotteryApp extends StatefulWidget {
  // This widget is the root of your application.

  LotteryApp({Key key}) : super(key: key);

  _LotteryAppState createState() => _LotteryAppState();
}

class _LotteryAppState extends State<LotteryApp> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController(
      initialPage: 1,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '昼飯決めるアプリ',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.barColor,
        ),
        body: PageView(
          controller: _pageController,
          children: <Widget>[
            ShopListPage(),
            LotteryPage(),
            RankingPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationView(_pageController),
      ),
    );
  }
}
