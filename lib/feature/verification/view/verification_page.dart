import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_courier_assistant_app/data/repository/auth_repository_impl.dart';
import 'package:smart_courier_assistant_app/exceptions/resending_code_exception.dart';
import 'package:smart_courier_assistant_app/exceptions/verification_code_exception.dart';
import 'package:smart_courier_assistant_app/feature/verification/cubit/cubit.dart';
import 'package:smart_courier_assistant_app/feature/verification/widgets/widgets.dart';
import 'package:smart_courier_assistant_app/localization/generated/l10n.dart';
import 'package:smart_courier_assistant_app/router/app_router.gr.dart';
import 'package:smart_courier_assistant_app/ui/ui_helper.dart';

@RoutePage()
class VerificationPage extends StatelessWidget {
  const VerificationPage({
    required this.email,
    super.key,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VerificationCubit(
        GetIt.I<AuthRepositoryImpl>(),
        email: email,
      ),
      child: const _VerificationView(),
    );
  }
}

class _VerificationView extends StatelessWidget {
  const _VerificationView();

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return Scaffold(
      body: BlocListener<VerificationCubit, VerificationState>(
        listenWhen: (previous, current) {
          return previous.verificationStatus != current.verificationStatus ||
              previous.resendingCodeStatus != current.resendingCodeStatus;
        },
        listener: (context, state) async {
          _showSnackBar(
            context,
            status: state.resendingCodeStatus,
            successMessage: l10n.verificationCodeSent,
            errorMessage: state.resendingCodeErrorStatus != null
                ? _mapResendingErrorStatusToMessage(
                    context,
                    state.resendingCodeErrorStatus,
                  )
                : null,
          );
          _showSnackBar(
            context,
            status: state.verificationStatus,
            successMessage: l10n.emailVerifiedSuccessfully,
            errorMessage: state.verificationErrorStatus != null
                ? _mapVerificationErrorStatusToMessage(
                    context,
                    state.verificationErrorStatus,
                  )
                : null,
          );
          if (state.verificationStatus == FormzSubmissionStatus.success) {
            await context.router.replace(const LoginRoute());
          }
        },
        child: SafeArea(
          minimum: const EdgeInsets.only(
            top: 50,
            left: 24,
            right: 24,
          ),
          child: Column(
            children: [
              Text(
                l10n.verifyYourEmail,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 10),
              const VerificationEmailText(),
              const Spacer(),
              const VerificationCodeTextField(),
              const SizedBox(height: 50),
              const SubmitCodeButton(),
              const SizedBox(height: 20),
              const ResendCodeSection(),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  String _mapVerificationErrorStatusToMessage(
    BuildContext context,
    VerificationErrorStatus? verificationErrorStatus,
  ) {
    final l10n = S.of(context);
    if (verificationErrorStatus == null) return '';

    switch (verificationErrorStatus) {
      case VerificationErrorStatus.validationFailed:
        return l10n.registerValidationFailed;
      case VerificationErrorStatus.invalidOtpCode:
        return l10n.invalidOtpCode;
      case VerificationErrorStatus.unknown:
        return l10n.verificationErrorUnknown;
    }
  }

  String _mapResendingErrorStatusToMessage(
    BuildContext context,
    ResendingCodeErrorStatus? resendingErrorStatus,
  ) {
    final l10n = S.of(context);
    if (resendingErrorStatus == null) return '';

    switch (resendingErrorStatus) {
      case ResendingCodeErrorStatus.validationFailed:
        return l10n.registerValidationFailed;
      case ResendingCodeErrorStatus.userNotFound:
        return l10n.userNotFound;
      case ResendingCodeErrorStatus.emailAlreadyVerified:
        return l10n.emailAlreadyVerified;
      case ResendingCodeErrorStatus.unknown:
        return l10n.resendingErrorUnknown;
    }
  }

  void _showSnackBar(
    BuildContext context, {
    required FormzSubmissionStatus status,
    required String successMessage,
    String? errorMessage,
  }) {
    if (status == FormzSubmissionStatus.success) {
      UiHelper.showSnackBar(
        context: context,
        message: successMessage,
      );
    } else if (status == FormzSubmissionStatus.failure &&
        errorMessage != null) {
      UiHelper.showSnackBar(
        context: context,
        message: errorMessage,
        isErrorSnackBar: true,
      );
    }
  }
}
