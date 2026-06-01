import 'package:flutter/material.dart';

class AppProgressIndicator extends StatelessWidget {
  final double? scale;
  final Color color;

  const AppProgressIndicator({
    super.key,
    this.scale,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }
}
