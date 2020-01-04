import 'package:flutter/material.dart';
import 'package:lunch_lottery/components/parts/bottom_navigation_view.dart';
import 'package:lunch_lottery/models/tab_item.dart';
import 'package:lunch_lottery/tab_navigator.dart';

class LotteryApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LotteryAppState();
}

class _LotteryAppState extends State<LotteryApp> {
  TabItem _currentTab = TabItem.lottery;

  ///
  Map<TabItem, GlobalKey<NavigatorState>> _navigatorKeys = {
    TabItem.shop: GlobalKey<NavigatorState>(),
    TabItem.lottery: GlobalKey<NavigatorState>(),
    TabItem.ranking: GlobalKey<NavigatorState>(),
  };

  /// タブをタップされたときの処理
  void _onSelectTab(TabItem item) {
    if (item == _currentTab) {
      // 選択されたタブのルートの最初の画面まで戻る
      _navigatorKeys[item].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // pop不可 == ルートの最初の画面かどうか
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentTab].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          // 抽選画面に居なければ、そこに遷移する。
          if (_currentTab != TabItem.lottery) {
            _onSelectTab(TabItem.lottery);
            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _buildOffstageNavigator(TabItem.shop),
            _buildOffstageNavigator(TabItem.lottery),
            _buildOffstageNavigator(TabItem.ranking),
          ],
        ),
        bottomNavigationBar: BottomNavigationView(
          _currentTab,
          _onSelectTab,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}
