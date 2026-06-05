import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/gen/fonts.gen.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';

class LoginDivider extends StatelessWidget {
  const LoginDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 10,
      children: [
        const Expanded(
          child: Divider(
            thickness: 1,
            color: Color(0xFFEDF1F3),
          ),
        ),
        Text(
          S.of(context).or,
          style: const TextStyle(
            color: Color(0xFF6C7278),
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontFamily: FontFamily.inter,
          ),
        ),
        const Expanded(
          child: Divider(
            thickness: 1,
            color: Color(0xFFEDF1F3),
          ),
        ),
      ],
    );
  }
}
