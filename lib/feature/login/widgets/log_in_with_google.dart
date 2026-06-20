import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:smart_courier_assistant_app/feature/login/cubit/login_cubit.dart';
import 'package:smart_courier_assistant_app/gen/assets.gen.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_elevated_button.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_progress_indicator.dart';

class LogInWithGoogle extends StatelessWidget {
  const LogInWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
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
      backgroundColor: isLoading
          ? colorScheme.surfaceContainerHighest
          : colorScheme.surfaceContainerLow,
      border: isLoading
          ? null
          : Border.all(
              color: colorScheme.outline,
            ),
      boxShadows: [
        BoxShadow(
          offset: const Offset(0, -3),
          blurRadius: 6,
          color: colorScheme.shadow.withValues(alpha: 0.25),
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
                Text(
                  S.of(context).continueWithGoogle,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
    );
  }
}
