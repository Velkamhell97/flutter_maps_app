import 'dart:math';

import 'package:flutter/material.dart';

class MarkerBPainter extends CustomPainter {
  final String duration;
  final String distance;
  final String title;
  final String subtitle;

  const MarkerBPainter({
    required this.duration, 
    required this.distance, 
    required this.title, 
    required this.subtitle
  });

  @override
  void paint(Canvas canvas, Size size) {
    final blackPaint = Paint()
    ..color = Colors.black;

    final whitePaint = Paint()
    ..color = Colors.white;

    const radius1 = 20.0;
    const diameter1 = radius1 * 2;
    final center1 = Offset(size.width / 2, size.height - radius1);

    const radius2 = 7.0;
    final center2 = Offset(center1.dx, center1.dy);

    //-Circles
    canvas.drawCircle(center1, radius1, blackPaint);
    canvas.drawCircle(center2, radius2, whitePaint);

    //-Box
    final box1 = Rect.fromLTWH(diameter1, 10, size.width - diameter1 - 10, size.height - 10 - diameter1);
    canvas.drawShadow(Path()..addRect(box1), Colors.black87, 7, false);
    canvas.drawRect(box1, whitePaint); //-La sombra se dibuja de primero

    const iconSize = 40.0;
    
    const spaceX = 10.0;
    const spaceY = 10.0;

    const paddingH = 20.0;
    final centerYTop = (box1.height - ((iconSize * 2) + spaceY)) / 2;

    const timer = Icons.timer_sharp;

    final timerPos = Offset(box1.left + paddingH, box1.top + centerYTop);

    final timerIcon = TextPainter(
      text: TextSpan(
        text: String.fromCharCode(timer.codePoint),
        style: TextStyle(color: Colors.white, fontSize: iconSize, fontFamily: timer.fontFamily)
      ),
      // textAlign: TextAlign.center,
      textDirection: TextDirection.ltr
    )..layout();
    
    final timerRect = Rect.fromLTWH(timerPos.dx, timerPos.dy, timerIcon.width, timerIcon.height);

    final timerText = TextPainter(
      text: TextSpan(
        text: duration,
        style: const TextStyle(color: Colors.white, fontSize: 30)
      ),
      // textAlign: TextAlign.center,
      textDirection: TextDirection.ltr
    )..layout();

    const route = Icons.route;
    final routePos = Offset(timerRect.left, timerRect.bottom + spaceY);

    final routeIcon = TextPainter(
      text: TextSpan(
        text: String.fromCharCode(route.codePoint),
        style: TextStyle(color: Colors.white, fontSize: iconSize, fontFamily: route.fontFamily)
      ),
      // textAlign: TextAlign.center,
      textDirection: TextDirection.ltr
    )..layout();

    final routeRect = Rect.fromLTWH(routePos.dx, routePos.dy, routeIcon.width, routeIcon.height);

    final routeText = TextPainter(
      text: TextSpan(
        text: distance,
        style: const TextStyle(color: Colors.white, fontSize: 30)
      ),
      // textAlign: TextAlign.center,
      textDirection: TextDirection.ltr
    )..layout();

    //-El cuadro se pinta segun el lado mas grande (se pinta antes de los textos)
    final maxWidth = max(timerText.width, routeText.width);
    final width = (paddingH * 2) + timerIcon.width + spaceX + maxWidth;
    final box2 = Rect.fromLTWH(box1.left, box1.top, width, box1.height);
    canvas.drawRect(box2, blackPaint);

    timerIcon.paint(canvas, timerPos);
    timerText.paint(canvas, Offset(timerRect.right + spaceX, timerRect.top + (timerIcon.height / 2) - (timerText.height / 2)));
    routeIcon.paint(canvas, routePos);
    routeText.paint(canvas, Offset(routeRect.right + spaceX, routeRect.top + (routeIcon.height / 2) - (routeText.height / 2)));
    // canvas.drawRect(timerRect, Paint()..color = Colors.red.withOpacity(0.5));

    final box3 = Rect.fromLTWH(box2.right, box2.top, box1.width - box2.width, box1.height);
    canvas.drawRect(box3, whitePaint);

    final titlePos = Offset(box3.left + paddingH, box3.top + spaceY);
    
    final titleText = TextPainter(
      maxLines: 2,
      ellipsis: '...',
      text: TextSpan(
        text: title,
        style: const TextStyle(color: Colors.black, fontSize: 32)
      ),
      textDirection: TextDirection.ltr
    )..layout(maxWidth: box3.width - (paddingH * 2));
    
    final titleRect = Rect.fromLTWH(titlePos.dx, titlePos.dy, titleText.width, titleText.height);

    final subtitleText = TextPainter(
      maxLines: 2,
      ellipsis: '...',
      text: TextSpan(
        text: subtitle,
        style: const TextStyle(color: Colors.grey, fontSize: 25)
      ),
      textDirection: TextDirection.ltr
    )..layout(maxWidth: box3.width - (paddingH * 2));

    titleText.paint(canvas, titlePos);
    subtitleText.paint(canvas, Offset(titleRect.left, titleRect.bottom + spaceY / 2));
    // final path1 = Path()
    // ..moveTo(diameter1, 10)
    // ..lineTo(size.width - 10, 10)
    // ..lineTo(size.width - 10, size.height - diameter1)
    // ..lineTo(diameter1, size.height - diameter1)
    // ..close();
    // canvas.drawShadow(path1, Colors.black , 10, false);
    // canvas.drawPath(path1, whitePaint);

  }

  @override
  bool shouldRepaint(MarkerBPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(MarkerBPainter oldDelegate) => false;
}