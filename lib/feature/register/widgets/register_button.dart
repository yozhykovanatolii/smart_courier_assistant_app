import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:smart_courier_assistant_app/feature/register/cubit/register_cubit.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/theme/app_colors.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_elevated_button.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_progress_indicator.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select<RegisterCubit, bool>(
      (registerCubit) =>
          registerCubit.state.formStatus == FormzSubmissionStatus.inProgress,
    );
    final isValid = context.select<RegisterCubit, bool>(
      (registerCubit) => registerCubit.state.isValid,
    );

    return AppElevatedButton(
      onPressed: !isValid || isLoading
          ? null
          : () {
              context.read<RegisterCubit>().registerUser();
            },
      padding: isLoading
          ? const EdgeInsetsGeometry.symmetric(vertical: 10)
          : const EdgeInsetsGeometry.symmetric(vertical: 16),
      backgroundColor: !isValid || isLoading
          ? Colors.grey
          : const Color(0xFF1D61E7),
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
              S.of(context).register,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
    );
  }
}
