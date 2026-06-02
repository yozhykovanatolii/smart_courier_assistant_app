import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/gen/fonts.gen.dart';

class SnackBarBody extends StatelessWidget {
  final Color backgroundColor;
  final Color color;
  final String message;
  final IconData iconData;

  const SnackBarBody({
    super.key,
    required this.backgroundColor,
    required this.color,
    required this.iconData,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      constraints: const BoxConstraints(minHeight: 57),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: color,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        spacing: 10,
        children: [
          Icon(
            iconData,
            color: color,
          ),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: color,
                fontFamily: FontFamily.inter,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
