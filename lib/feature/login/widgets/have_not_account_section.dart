import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/gen/fonts.gen.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';
import 'package:smart_courier_assistant_app/router/app_router.gr.dart';
import 'package:smart_courier_assistant_app/ui/app_colors.dart';

class HaveNotAccountSection extends StatelessWidget {
  const HaveNotAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return RichText(
      text: TextSpan(
        text: l10n.dontHaveAnAccount,
        style: const TextStyle(
          color: Color(0xFF6C7278),
          fontSize: 12,
          fontWeight: FontWeight.w500,
          fontFamily: FontFamily.inter,
        ),
        children: [
          const WidgetSpan(
            child: SizedBox(width: 5),
          ),
          TextSpan(
            text: l10n.signUp,
            style: const TextStyle(
              color: AppColors.blue500,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              fontFamily: FontFamily.inter,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.router.push(const RegisterRoute());
              },
          ),
        ],
      ),
    );
  }
}
