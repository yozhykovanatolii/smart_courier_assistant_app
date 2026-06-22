import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:smart_courier_assistant_app/domain/entity/order_entity.dart';
import 'package:smart_courier_assistant_app/feature/save_order/cubit/save_order_cubit.dart';
import 'package:smart_courier_assistant_app/localization/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/theme/app_colors.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_elevated_button.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_progress_indicator.dart';

class SaveOrderButton extends StatelessWidget {
  final OrderEntity? order;

  const SaveOrderButton({
    super.key,
    this.order,
  });

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select<SaveOrderCubit, bool>(
      (saveOrderCubit) =>
          saveOrderCubit.state.formStatus == FormzSubmissionStatus.inProgress,
    );
    final isValid = context.select<SaveOrderCubit, bool>(
      (saveOrderCubit) => saveOrderCubit.state.isValid,
    );

    return AppElevatedButton(
      onPressed: !isValid || isLoading
          ? null
          : () {
              context.read<SaveOrderCubit>().saveOrder(order);
            },
      padding: isLoading
          ? const EdgeInsetsGeometry.symmetric(vertical: 10)
          : const EdgeInsetsGeometry.symmetric(vertical: 16),
      backgroundColor: !isValid || isLoading ? Colors.grey : AppColors.blue600,
      boxShadows: !isValid || isLoading
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
      child: isLoading
          ? const AppProgressIndicator(scale: 0.7)
          : Text(
              S.of(context).save,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
    );
  }
}
