import 'package:flutter/material.dart';

/// ボトムナビゲーションバー
class BottomNavigationView extends StatefulWidget {
  BottomNavigationView({Key key}) : super(key: key);

  @override
  _BottomNavigationViewState createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  int _selectedIndex = 1;

  /// アイコンのタイトルテキストのStyle
  static const TextStyle titleStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        _createBottomNavigationBarItem(
            Icons.format_list_bulleted, Text("List")),
        _createBottomNavigationBarItem(Icons.home, Text("Home")),
        _createBottomNavigationBarItem(
            Icons.format_list_numbered, Text("ranking")),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }

  BottomNavigationBarItem _createBottomNavigationBarItem(
      IconData icon, Text title) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      title: title,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
