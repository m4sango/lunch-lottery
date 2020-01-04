import 'package:flutter/material.dart';
import 'package:lunch_lottery/components/shop_detail_page.dart';

class ShopListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("お店一覧"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShopDetailPage()),
            );
          },
          child: Text("テスト"),
        ),
      ),
    );
  }
}
