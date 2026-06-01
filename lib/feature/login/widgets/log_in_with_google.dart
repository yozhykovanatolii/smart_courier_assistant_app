import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:smart_courier_assistant_app/feature/login/cubit/login_cubit.dart';
import 'package:smart_courier_assistant_app/gen/assets.gen.dart';
import 'package:smart_courier_assistant_app/gen/fonts.gen.dart';
import 'package:smart_courier_assistant_app/ui/app_colors.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_elevated_button.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_progress_indicator.dart';

class LogInWithGoogle extends StatelessWidget {
  const LogInWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select<LoginCubit, bool>(
      (loginCubit) =>
          loginCubit.state.googleStatus == FormzSubmissionStatus.inProgress,
    );

    return AppElevatedButton(
      onPressed: isLoading
          ? null
          : () {
              context.read<LoginCubit>().signInWithGoogle();
            },
      padding: isLoading
          ? const EdgeInsetsGeometry.symmetric(vertical: 10)
          : const EdgeInsetsGeometry.symmetric(vertical: 16),
      backgroundColor: isLoading ? Colors.grey : Colors.white,
      border: isLoading
          ? null
          : Border.all(
              color: const Color(0xFFEFF0F6),
            ),
      boxShadows: [
        BoxShadow(
          offset: const Offset(0, -3),
          blurRadius: 6,
          color: const Color(0xFFF4F5FA).withValues(alpha: 0.6),
        ),
      ],
      child: isLoading
          ? const AppProgressIndicator(scale: 0.7)
          : Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 10,
              children: [
                Assets.icons.google.image(
                  width: 18,
                  height: 18,
                ),
                const Text(
                  'Continue with Google',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: FontFamily.inter,
                  ),
                ),
              ],
            ),
    );
  }
}
