import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/theme/app_colors.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_elevated_button.dart';

class SaveOrderButton extends StatelessWidget {
  const SaveOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      onPressed: () {},
      padding: const EdgeInsetsGeometry.symmetric(vertical: 16),
      backgroundColor: AppColors.blue600,
      boxShadows: [
        const BoxShadow(
          spreadRadius: 1,
          color: AppColors.blue700,
        ),
        BoxShadow(
          offset: const Offset(0, 1),
          blurRadius: 2,
          color: AppColors.blue800.withValues(alpha: 0.48),
        ),
      ],
      child: Text(
        S.of(context).save,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
    );
  }
}
