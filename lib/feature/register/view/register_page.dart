import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_courier_assistant_app/core/exceptions/register_exception.dart';
import 'package:smart_courier_assistant_app/feature/register/cubit/register_cubit.dart';
import 'package:smart_courier_assistant_app/feature/register/cubit/register_state.dart';
import 'package:smart_courier_assistant_app/feature/register/widgets/widgets.dart';
import 'package:smart_courier_assistant_app/gen/fonts.gen.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/app_colors.dart';
import 'package:smart_courier_assistant_app/ui/ui_helper.dart';
import 'package:smart_courier_assistant_app/ui/widgets/arrow_back_button.dart';

@RoutePage()
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<RegisterCubit>(),
      child: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<RegisterCubit, RegisterState>(
        listenWhen: (previous, current) {
          return previous.formStatus != current.formStatus;
        },
        listener: (context, state) {
          final formStatus = state.formStatus;
          if (formStatus == FormzSubmissionStatus.failure) {
            final errorMessage = _mapRegisterErrorStatusToString(
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
              message: S.of(context).successRegistration,
            );
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
              const Text(
                'Sign up',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  fontFamily: FontFamily.inter,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Create an account to continue!',
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
                'Full name',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  fontFamily: FontFamily.plusJakartaSans,
                ),
              ),
              const SizedBox(height: 5),
              const RegisterFullNameTextField(),
              const SizedBox(height: 25),
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
              const RegisterEmailTextField(),
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
              const RegisterPasswordTextField(),
              const SizedBox(height: 25),
              const Text(
                'Phone number',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  fontFamily: FontFamily.plusJakartaSans,
                ),
              ),
              const SizedBox(height: 5),
              const RegisterPhoneNumberTextField(),
              const SizedBox(height: 50),
              const RegisterButton(),
            ],
          ),
        ),
      ),
    );
  }

  String _mapRegisterErrorStatusToString(
    BuildContext context,
    RegisterErrorStatus? registerErrorStatus,
  ) {
    final l10n = S.of(context);
    if (registerErrorStatus == null) return '';

    switch (registerErrorStatus) {
      case RegisterErrorStatus.invalidEmail:
        return l10n.registerInvalidEmail;
      case RegisterErrorStatus.emailAlreadyInUse:
        return l10n.emailAlreadyInUse;
      case RegisterErrorStatus.weakPassword:
        return l10n.weakPassword;
      case RegisterErrorStatus.unknown:
        return l10n.registerErrorUnknown;
    }
  }
}
