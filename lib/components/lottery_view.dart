import 'package:flutter/material.dart';
import 'package:lunch_lottery/components/lottery_icon.dart';

/// 抽選画面
class LotteryView extends StatelessWidget {
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
              color: Colors.lightGreen, shape: CircleBorder()),
          child: IconButton(
            iconSize: 300,
            icon: LotteryIcon(200, 200),
            color: Colors.green,
            onPressed: () {},
          ),
        ),
      ),
    );
  }

//  VoidCallback _onButtonTapped() {}
}
