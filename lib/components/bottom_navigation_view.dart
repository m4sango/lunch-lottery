import 'package:flutter/material.dart';
import 'package:lunch_lottery/components/lottery_icon.dart';

/// ボトムナビゲーションバー
class BottomNavigationView extends StatefulWidget {
  BottomNavigationView({Key key}) : super(key: key);

  @override
  _BottomNavigationViewState createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  /// 選択中のアイコンの番号
  int _selectedIndex = 1;

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
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        _createBottomNavigationBarItem(
            Icon(Icons.format_list_bulleted),
            Text(
              _titleNameList[0],
              style: titleStyle,
            )),
        _createBottomNavigationBarItem(
            LotteryIcon(24, 24),
            Text(
              _titleNameList[1],
              style: titleStyle,
            )),
        _createBottomNavigationBarItem(
            Icon(Icons.format_list_numbered),
            Text(
              _titleNameList[2],
              style: titleStyle,
            )),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }

  /// ナビゲーションバーのアイテムを生成
  BottomNavigationBarItem _createBottomNavigationBarItem(
      Widget icon, Text title) {
    return BottomNavigationBarItem(
      icon: icon,
      title: title,
    );
  }

  /// アイテムタップ時の動作
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
