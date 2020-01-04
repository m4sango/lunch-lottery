import 'package:flutter/material.dart';
import 'package:lunch_lottery/components/parts/lottery_icon.dart';
import 'package:lunch_lottery/models/shop.dart';
import 'package:lunch_lottery/repository/shop_repository.dart';
import 'package:lunch_lottery/resources/colors.dart';

/// 店舗詳細画面
class ShopDetailPage extends StatefulWidget {
  final Shop currentData;

  ShopDetailPage() : currentData = null;

  ShopDetailPage.shop(Shop shop) : currentData = shop;

  @override
  ShopDetailPageState createState() => ShopDetailPageState(currentData);
}

class ShopDetailPageState extends State<ShopDetailPage> {
  final ShopRepository _shopRepository = ShopRepository();
  final Shop _currentData;
  bool _isSaveButtonEnabled;
  final _formKey = GlobalKey<FormState>();
  final List<String> _categoryNameList = <String>["和食", "中華", "洋食", "その他"];

  // 入力値
  String _shopName;
  String _category;
  int _visitNum;

  ShopDetailPageState(this._currentData);

  @override
  void initState() {
    super.initState();
    _shopName = _currentData?.shopName ?? "";
    _category = _currentData?.category ?? _categoryNameList.last;
    _visitNum = _currentData?.visitNum ?? 0;
    _isSaveButtonEnabled = _currentData != null ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("お店詳細"),
        backgroundColor: AppColors.barColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _shopPhoto(),
                    Padding(padding: EdgeInsets.only(right: 16)),
                    Flexible(
                      child: _shopNameField(),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 16)),
                _categoryField(),
                Padding(padding: EdgeInsets.only(top: 16)),
                _visitNumField(),
                Padding(padding: EdgeInsets.only(top: 16)),
                _saveButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 店舗写真
  Widget _shopPhoto() {
    // TODO: 店舗写真
    return LotteryIcon(100, 100, Colors.black);
  }

  /// 店舗名入力フィールド
  Widget _shopNameField() {
    return TextFormField(
      textAlign: TextAlign.end,
      maxLength: 30,
      initialValue: _shopName,
      decoration: const InputDecoration(
        hintText: "サイゼリア ○○店",
        labelText: "店舗名 *",
      ),
      onChanged: (String value) {
        _shopName = value;
        _formKey.currentState.validate();
      },
      validator: (String value) {
        print("テスト$value");
        if (value == null || value.isEmpty) {
          _buttonSwitch(false);
          return "必須項目です。";
        } else {
          _buttonSwitch(true);
          return null;
        }
      },
    );
  }

  /// カテゴリフィールド
  Widget _categoryField() {
    return DropdownButton<String>(
      isExpanded: true,
      value: _category,
      icon: Icon(Icons.arrow_downward),
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 1,
        color: Colors.black26,
      ),
      onChanged: (String value) {
        setState(() {
          _category = value;
        });
      },
      items: _categoryNameList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  /// 来店回数フィールド
  Widget _visitNumField() {
    return TextFormField(
      textAlign: TextAlign.end,
      enabled: false,
      initialValue: _visitNum.toString() + " 回",
      decoration: const InputDecoration(
        labelText: "来店回数",
      ),
    );
  }

  /// 保存ボタン
  Widget _saveButton() {
    return RaisedButton(
      color: Colors.lightBlue,
      disabledColor: Colors.grey,
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 50),
      onPressed: !_isSaveButtonEnabled
          ? null
          : () {
              if (_shopName.isEmpty) {
                return null;
              }
              if (_currentData == null) {
                // 新規登録
                _shopRepository.insert(Shop.insert(_shopName, _category));
              } else {
                _shopRepository.update(Shop(_currentData.id, _shopName,
                    _category, _currentData.visitNum));
              }

              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('保存しました')));

              Navigator.pop(context);
            },
      child: Text(
        "保存",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void _buttonSwitch(bool enabled) {
    setState(() {
      _isSaveButtonEnabled = enabled;
    });
  }
}
