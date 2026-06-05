import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:smart_courier_assistant_app/feature/login/cubit/login_cubit.dart';
import 'package:smart_courier_assistant_app/gen/fonts.gen.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_elevated_button.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_progress_indicator.dart';

class LogInButton extends StatelessWidget {
  const LogInButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select<LoginCubit, bool>(
      (loginCubit) => loginCubit.state.loginStatus.isInProgress,
    );

    return AppElevatedButton(
      onPressed: isLoading
          ? null
          : () {
              context.read<LoginCubit>().signInWithEmailAndPassword();
            },
      padding: isLoading
          ? const EdgeInsetsGeometry.symmetric(vertical: 10)
          : const EdgeInsetsGeometry.symmetric(vertical: 16),
      backgroundColor: isLoading ? Colors.grey : const Color(0xFF1D61E7),
      boxShadows: isLoading
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
              S.of(context).logIn,
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
