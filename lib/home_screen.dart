import 'package:flutter/material.dart';

import 'circle_painter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final _radius = 10.0;

  final _backRadius = 20.0;

  late AnimationController _animationController;

  late Animation<double> _animationRadius;

  @override
  void initState() {
    _animationController = AnimationController(duration: const Duration(milliseconds: 1500), vsync: this);

    _animationRadius = Tween(begin: 0.0, end: _backRadius).animate(_animationController)..addListener(() => setState(() {}));

    _animationController.repeat(reverse: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: _radius, vertical: _radius),
          child: CustomPaint(painter: CirclePainter(_radius, _backRadius, _animationRadius.value)),
        ),
      ),
    );
  }
}
