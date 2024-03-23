import 'package:flutter/material.dart';

import 'circlePainter.dart';

class LightSpot extends StatefulWidget {
  const LightSpot({super.key});

  @override
  _LightSpot createState() => _LightSpot();
}

class _LightSpot extends State<LightSpot> with TickerProviderStateMixin {
  final _radius = 10.0; //基本光点のサイズ
  final _backRadius = 20.0; //後光のサイズ
  late AnimationController _animationController;
  late Animation<double> _animationRadius;

  @override
  void initState() {
    //アニメーションコントローラの設定
    _animationController = AnimationController(duration: const Duration(milliseconds: 1500), vsync: this);
    //アニメーションの設定
    _animationRadius = Tween(begin: 0.0, end: _backRadius).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    //繰り返し、反転無し
    _animationController.repeat(reverse: false);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        margin: const EdgeInsets.all(50),
        child: CustomPaint(
          painter: CirclePainter(
            _radius,
            _backRadius,
            _animationRadius.value,
          ),
        ),
      ),
    ));
  }
}
