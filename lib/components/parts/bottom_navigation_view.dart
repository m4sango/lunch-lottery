import 'package:flutter/material.dart';

import 'lottery_icon.dart';

/// ボトムナビゲーションバー
class BottomNavigationView extends StatefulWidget {
  final PageController _pageController;

  BottomNavigationView(this._pageController);

  @override
  _BottomNavigationViewState createState() =>
      _BottomNavigationViewState(_pageController);
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  /// 選択中のアイコンの番号
  int _currentIndex = 1;
  BottomNavigationBarType _type = BottomNavigationBarType.shifting;
  List<BottomNavigationBarItem> _navigationBarItemList;
  PageController _pageController;

  _BottomNavigationViewState(this._pageController);

  /// アイコンのタイトルテキストのStyle
  static const TextStyle titleStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );

  /// アイコンのタイトルテキストのリスト
  static const List<String> _titleNameList = [
    "List",
    "Lottery",
    "Rank",
  ];

  @override
  void initState() {
    super.initState();
    _navigationBarItemList = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.format_list_bulleted),
        title: Text(
          _titleNameList[0],
          style: titleStyle,
        ),
        backgroundColor: Colors.lightGreen,
      ),
      BottomNavigationBarItem(
        icon: LotteryIcon(24, 24, Colors.white),
        title: Text(
          _titleNameList[1],
          style: titleStyle,
        ),
        backgroundColor: Colors.lightGreen,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.format_list_numbered),
        title: Text(
          _titleNameList[2],
          style: titleStyle,
        ),
        backgroundColor: Colors.lightGreen,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: _navigationBarItemList,
      currentIndex: _currentIndex,
      type: _type,
      onTap: _onItemTapped,
    );
  }

  /// アイテムタップ時の動作
  void _onItemTapped(int index) {
    setState(() {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      _currentIndex = index;
    });
  }
}
