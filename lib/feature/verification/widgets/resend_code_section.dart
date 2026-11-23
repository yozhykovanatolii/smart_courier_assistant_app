import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/localization/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/theme/app_colors.dart';

class ResendCodeSection extends StatelessWidget {
  const ResendCodeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final bodySmallStyle = Theme.of(context).textTheme.bodySmall;

    return RichText(
      text: TextSpan(
        text: l10n.didntReceiveCode,
        style: bodySmallStyle?.copyWith(
          color: AppColors.grey,
        ),
        children: [
          const WidgetSpan(
            child: SizedBox(width: 5),
          ),
          TextSpan(
            text: l10n.resend,
            style: bodySmallStyle?.copyWith(
              color: AppColors.blue500,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.blue500,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
        ],
      ),
    );
  }
}
