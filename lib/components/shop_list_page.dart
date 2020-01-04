import 'package:flutter/material.dart';
import 'package:lunch_lottery/components/shop_detail_page.dart';
import 'package:lunch_lottery/models/shop.dart';
import 'package:lunch_lottery/repository/shop_repository.dart';
import 'package:lunch_lottery/resources/colors.dart';

/// お店一覧画面
class ShopListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ShopListPageState();
}

class ShopListPageState extends State<ShopListPage> {
  final ShopRepository _shopRepository = ShopRepository();

  @override
  Widget build(BuildContext context) {
    Future<List<Shop>> futureShopList = _shopRepository.selectAll();

    return Scaffold(
      appBar: AppBar(
        title: Text("お店一覧"),
        backgroundColor: AppColors.barColor,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ShopDetailPage()),
          );
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder<List<Shop>>(
        future: futureShopList,
        builder: (BuildContext context, AsyncSnapshot<List<Shop>> snapshot) {
          if (!snapshot.hasData || snapshot.data.isEmpty) {
            return Center(
              child: Text("ランチでよく行くお店を追加してね！"),
            );
          }
          List<Shop> shopList = snapshot.data;
          return ListView.separated(
            itemCount: shopList.length,
            itemBuilder: (context, index) {
              final item = shopList[index];

              return Dismissible(
                key: Key(item.id.toString()),
                // スワイプ実行
                onDismissed: (direction) {
                  setState(() {
                    _shopRepository.delete(item.id);
                    shopList.removeAt(index);
                  });

                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(item.shopName + "をリストから削除しました。"),
                  ));
                },
                background: Container(
                  padding: EdgeInsets.only(right: 8),
                  alignment: Alignment.centerRight,
                  color: Colors.grey,
                  child: Icon(Icons.delete),
                ),
                child: _buildListTile(item),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                thickness: 1.5,
              );
            },
          );
        },
      ),
    );
  }

  ListTile _buildListTile(Shop shop) {
    return ListTile(
      title: Text(shop.shopName),
      subtitle: Text(shop.category),
      // リストをタップしたら詳細画面へ
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ShopDetailPage.shop(shop)),
        );
      },
    );
  }
}
