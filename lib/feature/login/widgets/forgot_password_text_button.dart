import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/gen/fonts.gen.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';
import 'package:smart_courier_assistant_app/router/app_router.gr.dart';
import 'package:smart_courier_assistant_app/ui/app_colors.dart';

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
        style: const TextStyle(
          color: AppColors.blue500,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          fontFamily: FontFamily.inter,
        ),
      ),
    );
  }
}
