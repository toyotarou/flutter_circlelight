import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  final lightColor = Colors.greenAccent;

  final Map<int, Map<String, double>> lightLayers = {
    0: {'maxOpacity': 0.5},
    1: {'maxOpacity': 0.3}
  };

  double basicRadius; //光点の基本サイズ
  double maxBackRadius; //後光の最大サイズ
  double animationRadius; //後光アニメーションサイズ

  CirclePainter(this.basicRadius, this.maxBackRadius, this.animationRadius);

  @override
  void paint(Canvas canvas, Size size) {
    var c = const Offset(0, 0);

    canvas.drawCircle(
      c,
      basicRadius,
      Paint()
        ..color = lightColor
        ..style = PaintingStyle.fill,
    );

    var size = basicRadius;

    //後光配列ループ
    for (var i = 0; i < lightLayers.length; i++) {
      var row = lightLayers[i]!;
      //後光の透明度の算出
      var opacity = animationRadius * (row['maxOpacity']! / maxBackRadius * -1) + row['maxOpacity']!;
      //誤差でmax-min外れないように
      opacity = opacity < 0.0 ? 0.0 : opacity;
      opacity = opacity > 1.0 ? 1.0 : opacity;
      //後光サイズ
      size += animationRadius;
      //後光描画
      canvas.drawCircle(
        c,
        size,
        Paint()
          ..style = PaintingStyle.fill //塗り潰しの円
          ..color = lightColor.withOpacity(opacity),
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
