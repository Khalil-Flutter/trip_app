import 'package:flutter/material.dart';

class CircleTabBarIndicator extends Decoration {
  final Color color;
  final double radius;

  const CircleTabBarIndicator({
    required this.color,
    required this.radius,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return CirclePainter(
      color: color,
      radius: radius,
    );
  }
}

class CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  CirclePainter({
    required this.color,
    required this.radius,
  });

  @override
  void paint(
    Canvas canvas,
    Offset offset,
    ImageConfiguration configuration,
  ) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
      configuration.size!.width / 2 - radius / 2,
      configuration.size!.height - radius / 2,
    );
    canvas.drawCircle(
      offset + circleOffset,
      radius,
      paint,
    );
  }
}
