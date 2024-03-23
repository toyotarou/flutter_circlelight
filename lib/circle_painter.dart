import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  CirclePainter(this.basicRadius, this.maxBackRadius, this.animationRadius);

  double basicRadius;
  double maxBackRadius;
  double animationRadius;

  final lightColor = Colors.greenAccent;

  final Map<int, Map<String, double>> lightLayers = {
    0: {'maxOpacity': 0.5},
    1: {'maxOpacity': 0.3}
  };

  ///
  @override
  void paint(Canvas canvas, Size size) {
    var c = const Offset(0, 0);

    canvas.drawCircle(
      c,
      basicRadius,
      Paint()
//        ..color = lightColor
        ..color = Colors.transparent
        ..style = PaintingStyle.fill,
    );

    var size = basicRadius;

    for (var i = 0; i < lightLayers.length; i++) {
      var row = lightLayers[i]!;

      //
      var opacity = animationRadius * (row['maxOpacity']! / maxBackRadius * -1) + row['maxOpacity']!;

      //
      opacity = (opacity < 0.0) ? 0.0 : opacity;
      opacity = (opacity > 1.0) ? 1.0 : opacity;

      //
      size += animationRadius;

      //
      canvas.drawCircle(
        c,
        size,
        Paint()
          ..style = PaintingStyle.fill
          ..color = lightColor.withOpacity(opacity),
      );
    }
  }

  ///
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
