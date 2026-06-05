import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_courier_assistant_app/core/exceptions/reset_password_exception.dart';
import 'package:smart_courier_assistant_app/feature/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:smart_courier_assistant_app/feature/forgot_password/cubit/forgot_password_state.dart';
import 'package:smart_courier_assistant_app/feature/forgot_password/widgets/widgets.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/ui_helper.dart';
import 'package:smart_courier_assistant_app/ui/widgets/arrow_back_button.dart';

@RoutePage()
class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<ForgotPasswordCubit>(),
      child: const _ForgotPasswordView(),
    );
  }
}

class _ForgotPasswordView extends StatelessWidget {
  const _ForgotPasswordView();

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
        listenWhen: (previous, current) {
          return previous.formStatus != current.formStatus;
        },
        listener: (context, state) {
          final formStatus = state.formStatus;
          if (formStatus == FormzSubmissionStatus.failure) {
            final errorMessage = _mapResetPasswordErrorStatusToString(
              context,
              state.errorStatus,
            );
            UiHelper.showSnackBar(
              context: context,
              message: errorMessage,
              isErrorSnackBar: true,
            );
          }
          if (formStatus == FormzSubmissionStatus.success) {
            UiHelper.showSnackBar(
              context: context,
              message: S.of(context).resetEmailLetter,
            );
            context.router.maybePop();
          }
        },
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.only(
              top: 30,
              left: 24,
              right: 24,
            ),
            children: [
              const Align(
                alignment: AlignmentGeometry.centerStart,
                child: ArrowBackButton(),
              ),
              const SizedBox(height: 20),
              Text(
                l10n.forgotPassword,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 10),
              Text(
                l10n.enterYourEmailAddress,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 45),
              Text(
                l10n.email,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 5),
              const EmailTextField(),
              const SizedBox(height: 30),
              const ResetPasswordButton(),
            ],
          ),
        ),
      ),
    );
  }

  String _mapResetPasswordErrorStatusToString(
    BuildContext context,
    ResetPasswordErrorStatus? resetPasswordErrorStatus,
  ) {
    final l10n = S.of(context);

    if (resetPasswordErrorStatus == null) return '';

    switch (resetPasswordErrorStatus) {
      case ResetPasswordErrorStatus.invalidEmail:
        return l10n.invalidEmail;
      case ResetPasswordErrorStatus.tooManyRequests:
        return l10n.tooManyRequests;
      case ResetPasswordErrorStatus.networkRequestFailed:
        return l10n.networkRequestFailed;
      case ResetPasswordErrorStatus.unknown:
        return l10n.resetPasswordErrorUnknown;
    }
  }
}
