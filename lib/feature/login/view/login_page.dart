import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_courier_assistant_app/core/exceptions/login_exception.dart';
import 'package:smart_courier_assistant_app/core/exceptions/login_with_google_exception.dart';
import 'package:smart_courier_assistant_app/feature/login/cubit/login_cubit.dart';
import 'package:smart_courier_assistant_app/feature/login/cubit/login_state.dart';
import 'package:smart_courier_assistant_app/feature/login/widgets/widgets.dart';
import 'package:smart_courier_assistant_app/gen/fonts.gen.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/app_colors.dart';
import 'package:smart_courier_assistant_app/ui/ui_helper.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<LoginCubit>(),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<LoginCubit, LoginState>(
        listenWhen: (previous, current) {
          return previous.loginStatus != current.loginStatus ||
              previous.googleStatus != current.googleStatus;
        },
        listener: (context, state) {
          final l10n = S.of(context);
          final loginStatus = state.loginStatus;
          final googleStatus = state.googleStatus;

          if (googleStatus == FormzSubmissionStatus.failure) {
            final errorMessage = _mapLoginGoogleErrorStatusToString(
              context,
              state.loginGoogleErrorStatus,
            );
            UiHelper.showSnackBar(
              context: context,
              message: errorMessage,
              isErrorSnackBar: true,
            );
          }
          if (googleStatus == FormzSubmissionStatus.success) {
            UiHelper.showSnackBar(
              context: context,
              message: l10n.successAuthorizationWithGoogle,
            );
          }
          if (loginStatus == FormzSubmissionStatus.failure) {
            final errorMessage = _mapLoginErrorStatusToString(
              context,
              state.loginErrorStatus,
            );
            UiHelper.showSnackBar(
              context: context,
              message: errorMessage,
              isErrorSnackBar: true,
            );
          }
          if (loginStatus == FormzSubmissionStatus.success) {
            UiHelper.showSnackBar(
              context: context,
              message: l10n.successAuthorization,
            );
          }
        },
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.only(
              top: 40,
              left: 24,
              right: 24,
            ),
            children: [
              const Text(
                'Sign in to your Account',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  fontFamily: FontFamily.inter,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Enter your email and password to log in',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  fontFamily: FontFamily.inter,
                ),
              ),
              const SizedBox(height: 45),
              const Text(
                'Email',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  fontFamily: FontFamily.plusJakartaSans,
                ),
              ),
              const SizedBox(height: 5),
              const LoginEmailField(),
              const SizedBox(height: 25),
              const Text(
                'Password',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  fontFamily: FontFamily.plusJakartaSans,
                ),
              ),
              const SizedBox(height: 5),
              const LoginPasswordField(),
              const SizedBox(height: 20),
              const Align(
                alignment: AlignmentGeometry.centerEnd,
                child: ForgotPasswordTextButton(),
              ),
              const SizedBox(height: 20),
              const LogInButton(),
              const SizedBox(height: 30),
              const LoginDivider(),
              const SizedBox(height: 30),
              const LogInWithGoogle(),
              const SizedBox(height: 65),
              const Align(
                alignment: AlignmentGeometry.bottomCenter,
                child: HaveNotAccountSection(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _mapLoginErrorStatusToString(
    BuildContext context,
    LoginErrorStatus? loginErrorStatus,
  ) {
    final l10n = S.of(context);

    if (loginErrorStatus == null) return '';

    switch (loginErrorStatus) {
      case LoginErrorStatus.invalidEmail:
        return l10n.invalidEmail;
      case LoginErrorStatus.userDisabled:
        return l10n.userDisabled;
      case LoginErrorStatus.wrongPassword:
        return l10n.wrongPassword;
      case LoginErrorStatus.invalidCredential:
        return l10n.invalidCredential;
      case LoginErrorStatus.unknown:
        return l10n.loginErrorUnknown;
    }
  }

  String _mapLoginGoogleErrorStatusToString(
    BuildContext context,
    LoginGoogleErrorStatus? loginGoogleErrorStatus,
  ) {
    final l10n = S.of(context);

    if (loginGoogleErrorStatus == null) return '';

    switch (loginGoogleErrorStatus) {
      case LoginGoogleErrorStatus.accountWithDifferentCredential:
        return l10n.accountExistsWithDifferentCredentials;
      case LoginGoogleErrorStatus.userDisabled:
        return l10n.userDisabled;
      case LoginGoogleErrorStatus.wrongPassword:
        return l10n.wrongPassword;
      case LoginGoogleErrorStatus.invalidCredential:
        return l10n.invalidCredential;
      case LoginGoogleErrorStatus.unknown:
        return l10n.loginErrorUnknown;
    }
  }
}
