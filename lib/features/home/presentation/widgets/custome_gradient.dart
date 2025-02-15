import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui' as ui;

import 'package:shamsoon/core/app_colors.dart';

class GradientPieChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = ui.Gradient.sweep(
        Offset(size.width / 2, size.height / 2), 
        [
          Colors.grey.shade300,
          AppColors.primaryColor,
          Colors.green.shade600,
          Colors.yellow.shade700,
          Colors.redAccent,
        ],
        [0.0, 0.4,0.4, 0.7, 1.0],
        TileMode.clamp,
      )
      ..style = PaintingStyle.stroke
      ..strokeWidth = 18.w
      ..strokeCap = StrokeCap.round;

    // رسم القوس بشكل صحيح من الأعلى
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: 160.w,
        height: 160.h,
      ),
      -90 * (3.1415927 / 180),
      270 * (3.1415927 / 150),
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}