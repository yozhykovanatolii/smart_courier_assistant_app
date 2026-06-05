import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:smart_courier_assistant_app/feature/register/cubit/register_cubit.dart';
import 'package:smart_courier_assistant_app/gen/fonts.gen.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';
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
                color: Color(0xFF375DFB),
              ),
              BoxShadow(
                offset: const Offset(0, 1),
                blurRadius: 2,
                color: const Color(0xFF253EA7).withValues(alpha: 0.48),
              ),
            ],
      child: isLoading
          ? const AppProgressIndicator(scale: 0.7)
          : Text(
              S.of(context).register,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                fontFamily: FontFamily.inter,
              ),
            ),
    );
  }
}
