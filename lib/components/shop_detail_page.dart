import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lunch_lottery/models/shop.dart';
import 'package:lunch_lottery/repository/shop_repository.dart';

class ShopDetailPage extends StatefulWidget {
  @override
  ShopDetailPageState createState() => ShopDetailPageState();
}

class ShopDetailPageState extends State<ShopDetailPage> {
  final ShopRepository _shopRepository = ShopRepository();

  @override
  Widget build(BuildContext context) {
    Shop shop = Shop(null, "名前", "中華", 1);

    _shopRepository.insert(shop);

    Future<List<Shop>> shopList = _shopRepository.selectAll();

    shopList.then((result){
      print("件数: " + result.length.toString());
      result.forEach((val){
        print("テスト: " + val.toString());
      });
    });

    return Text("テスト");
  }
}
