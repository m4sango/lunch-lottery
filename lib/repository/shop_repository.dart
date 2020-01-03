import 'dart:async';

import 'package:lunch_lottery/models/shop.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// 店舗データを扱うrepositoryクラス
class ShopRepository {
  static final ShopRepository _instance = ShopRepository._internal();
  static const _tableName = "shop";
  Future<Database> _database;

  factory ShopRepository() => _instance;

  ShopRepository._internal() {
    this._database = open();
  }

  Future<Database> open() async {
    return openDatabase(
      join(await getDatabasesPath(), "lottery_database.db"),
      onCreate: (db, version) {
        return db.execute(
            "CREATE TABLE $_tableName(id INTEGER PRIMARY KEY AUTOINCREMENT, shopName TEXT, category TEXT, visitNum INTEGER)");
      },
      version: 1,
    );
  }

  /// データ全件取得
  Future<List<Shop>> selectAll() async {
    final Database db = await _database;

    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    return List.generate(maps.length, (i) {
      return Shop(
        maps[i]["id"],
        maps[i]["shopName"],
        maps[i]["category"],
        maps[i]["visitNum"],
      );
    });
  }

  /// データ追加
  Future<void> insert(Shop shop) async {
    final Database db = await _database;

    await db.insert(
      _tableName,
      shop.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// データ更新
  Future<void> update(Shop shop) async {
    final Database db = await _database;

    await db.update(
      _tableName,
      shop.toMap(),
      where: "id = ?",
      whereArgs: [shop.id],
    );
  }

  /// データ削除
  Future<void> delete(int id) async {
    final Database db = await _database;

    await db.delete(
      _tableName,
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
