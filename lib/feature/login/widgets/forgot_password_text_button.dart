import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/localization/generated/l10n.dart';
import 'package:smart_courier_assistant_app/router/app_router.gr.dart';
import 'package:smart_courier_assistant_app/ui/theme/app_colors.dart';

class ForgotPasswordTextButton extends StatelessWidget {
  const ForgotPasswordTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(const ForgotPasswordRoute());
      },
      child: Text(
        S.of(context).forgotPassword,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: AppColors.blue500,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
