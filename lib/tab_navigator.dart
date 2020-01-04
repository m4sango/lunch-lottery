import 'package:flutter/material.dart';
import 'package:lunch_lottery/components/lottery_page.dart';
import 'package:lunch_lottery/components/ranking_page.dart';
import 'package:lunch_lottery/components/shop_list_page.dart';

import 'models/tab_item.dart';

class TabNavigatorRoutes {
  static const String shopList = '/shop';
  static const String lottery = '/lottery';
  static const String ranking = '/ranking';
  static const String root = '/';
}

/// タブ操作クラス
class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});

  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  /// 次の画面に遷移する。
  void push(BuildContext context, Widget next) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => next,
      ),
    );
  }

  /// 各タブのルート
  Map<String, WidgetBuilder> _routeBuilders() {
    return {
      TabNavigatorRoutes.shopList: (context) => ShopListPage(),
      TabNavigatorRoutes.lottery: (context) => LotteryPage(),
      TabNavigatorRoutes.ranking: (context) => RankingPage(),
    };
  }

  final Map<TabItem, String> _tabItemRoutes = {
    TabItem.shop: TabNavigatorRoutes.shopList,
    TabItem.lottery: TabNavigatorRoutes.lottery,
    TabItem.ranking: TabNavigatorRoutes.ranking,
  };

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        if (routeSettings.name == TabNavigatorRoutes.root) {
          return MaterialPageRoute(
            builder: (context) =>
                _routeBuilders()[_tabItemRoutes[tabItem]](context),
          );
        }
        return MaterialPageRoute(
          builder: (context) => _routeBuilders()[routeSettings.name](context),
        );
      },
    );
  }
}
