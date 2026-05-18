import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/gen/fonts.gen.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 10,
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: Color(0xFFEDF1F3),
          ),
        ),
        Text(
          'Or',
          style: TextStyle(
            color: Color(0xFF6C7278),
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontFamily: FontFamily.inter,
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: Color(0xFFEDF1F3),
          ),
        ),
      ],
    );
  }
}
