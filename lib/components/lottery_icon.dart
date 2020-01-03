import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// 抽選アイコン
class LotteryIcon extends StatelessWidget {
  /// lotteryアイコンのファイルパス
  static const String _lotteryAssetsPath = "assets/icon/lottery.svg";

  final double width;
  final double height;

  LotteryIcon(this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      _lotteryAssetsPath,
      width: this.width,
      height: this.height,
    );
  }
}
