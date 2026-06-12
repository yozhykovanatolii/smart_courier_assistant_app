import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerFactory {
  static final Map<int, BitmapDescriptor> _cache = {};

  static Future<BitmapDescriptor> numberedMarker(int number) async {
    if (_cache.containsKey(number)) {
      return _cache[number]!;
    }

    const int size = 80;

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    final center = const Offset(size / 2.2, size / 2.2);

    final paint = Paint()
      ..color = Colors.blue
      ..isAntiAlias = true;

    final borderPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true;

    // КРУГ
    canvas.drawCircle(center, size / 4.4, paint);
    canvas.drawCircle(center, size / 4.4, borderPaint);

    // ЦИФРА
    final textPainter = TextPainter(
      text: TextSpan(
        text: number.toString(),
        style: const TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        center.dx - textPainter.width / 2.2,
        center.dy - textPainter.height / 2.2,
      ),
    );

    final image = await recorder.endRecording().toImage(size, size);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    final descriptor = BitmapDescriptor.bytes(
      byteData!.buffer.asUint8List(),
    );

    _cache[number] = descriptor;
    return descriptor;
  }
}
