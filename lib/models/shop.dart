/// Shopデータ
/// SQLiteで保存することを想定
class Shop {
  /// 一意なID
  final int shopId;

  /// 店名
  final String shopName;

  /// カテゴリ(和食etc)
  final String category;

  /// 来店回数
  final int visitNum;

  Shop(this.shopId, this.shopName, this.category, this.visitNum);

  Map<String, dynamic> toMap() {
    return {
      "shopId": shopId,
      "shopName": shopName,
      "category": category,
      "visitNum": visitNum,
    };
  }
}
