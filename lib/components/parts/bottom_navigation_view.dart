import 'package:flutter/material.dart';
import 'package:lunch_lottery/models/tab_item.dart';
import 'package:lunch_lottery/resources/colors.dart';

import 'lottery_icon.dart';

/// ボトムナビゲーションバー
class BottomNavigationView extends StatelessWidget {
  final TabItem _currentTab;
  final ValueChanged<TabItem> _onSelectTab;

  /// タブタイトル
  final Map<TabItem, String> _tabName = {
    TabItem.shop: "Shop",
    TabItem.lottery: "Lottery",
    TabItem.ranking: "Rank",
  };

  /// タブアイコン
  Map<TabItem, Widget> _tabIcon;

  BottomNavigationView(this._currentTab, this._onSelectTab);

  @override
  Widget build(BuildContext context) {
    _tabIcon = {
      TabItem.shop: Icon(
        Icons.store,
        color: _colorTabMatching(TabItem.shop),
      ),
      TabItem.lottery: LotteryIcon(24, 24, _colorTabMatching(TabItem.lottery)),
      TabItem.ranking: Icon(
        Icons.format_list_numbered,
        color: _colorTabMatching(TabItem.ranking),
      ),
    };

    return BottomNavigationBar(
      elevation: 64,
      items: [
        _buildItem(TabItem.shop),
        _buildItem(TabItem.lottery),
        _buildItem(TabItem.ranking),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: 1,
      onTap: (index) => _onSelectTab(TabItem.values[index]),
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    return BottomNavigationBarItem(
      icon: _tabIcon[tabItem],
      title: Text(
        _tabName[tabItem],
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: _colorTabMatching(tabItem),
        ),
      ),
      backgroundColor: AppColors.barColor,
    );
  }

  Color _colorTabMatching(TabItem item) {
    return _currentTab == item ? AppColors.barColor : Colors.grey;
  }
}
