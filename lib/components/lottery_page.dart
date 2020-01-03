import 'package:flutter/material.dart';
import 'package:lunch_lottery/components/parts/lottery_icon.dart';
import 'package:lunch_lottery/resources/colors.dart';

/// 抽選画面
class LotteryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _LotteryButton(),
        ],
      ),
    );
  }
}

/// 抽選ボタン
class _LotteryButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Ink(
          decoration: const ShapeDecoration(
            color: AppColors.barColor,
            shape: CircleBorder(),
          ),
          child: IconButton(
            iconSize: 300,
            icon: LotteryIcon(200, 200, Colors.black),
            color: Colors.green,
            onPressed: () {},
          ),
        ),
      ),
    );
  }

//  VoidCallback _onButtonTapped() {}
}
