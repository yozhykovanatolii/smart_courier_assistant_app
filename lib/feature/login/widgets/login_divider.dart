import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/localization/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/theme/app_colors.dart';

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
            color: AppColors.grey300,
          ),
        ),
        Text(
          S.of(context).or,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.grey,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Expanded(
          child: Divider(
            thickness: 1,
            color: AppColors.grey300,
          ),
        ),
      ],
    );
  }
}
