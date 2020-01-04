/// Shopデータ
/// SQLiteで保存することを想定
class Shop {
  /// 一意なID
  final int id;

  /// 店名
  final String shopName;

  /// カテゴリ(和食etc)
  final String category;

  /// 来店回数
  final int visitNum;

  Shop(this.id, this.shopName, this.category, this.visitNum);
  
  Shop.insert(String shopName, String category)
      : this.id = null,
        this.shopName = shopName,
        this.category = category,
        this.visitNum = 0;

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "shopName": shopName,
      "category": category,
      "visitNum": visitNum,
    };
  }

  @override
  String toString() {
    return "Shop{id: $id, shopName: $shopName, category: $category, visitNum: $visitNum}";
  }
}
