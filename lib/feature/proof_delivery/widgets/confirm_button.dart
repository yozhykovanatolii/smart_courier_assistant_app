import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/feature/proof_delivery/cubit/proof_delivery_cubit.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/theme/app_colors.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_elevated_button.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isValid = context.select<ProofDeliveryCubit, bool>(
      (proofDeliveryCubit) => proofDeliveryCubit.state.isValid,
    );

    return AppElevatedButton(
      onPressed: !isValid ? null : () {},
      padding: const EdgeInsetsGeometry.symmetric(vertical: 16),
      backgroundColor: !isValid ? Colors.grey : AppColors.blue600,
      boxShadows: !isValid
          ? null
          : [
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
        S.of(context).confirm,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
    );
  }
}
