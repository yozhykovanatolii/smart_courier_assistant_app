import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_courier_assistant_app/exceptions/register_exception.dart';
import 'package:smart_courier_assistant_app/feature/register/cubit/register_cubit.dart';
import 'package:smart_courier_assistant_app/feature/register/cubit/register_state.dart';
import 'package:smart_courier_assistant_app/feature/register/widgets/widgets.dart';
import 'package:smart_courier_assistant_app/localization/generated/l10n.dart';
import 'package:smart_courier_assistant_app/router/app_router.gr.dart';
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
    final l10n = S.of(context);
    final labelLargeStyle = Theme.of(context).textTheme.labelLarge;

    return Scaffold(
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
            context.router.replace(const VerificationRoute());
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
                l10n.signUp,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 10),
              Text(
                l10n.createAnAccountToContinue,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 45),
              Text(
                l10n.fullName,
                style: labelLargeStyle,
              ),
              const SizedBox(height: 5),
              const RegisterFullNameTextField(),
              const SizedBox(height: 25),
              Text(
                l10n.email,
                style: labelLargeStyle,
              ),
              const SizedBox(height: 5),
              const RegisterEmailTextField(),
              const SizedBox(height: 25),
              Text(
                l10n.password,
                textAlign: TextAlign.start,
                style: labelLargeStyle,
              ),
              const SizedBox(height: 5),
              const RegisterPasswordTextField(),
              const SizedBox(height: 25),
              Text(
                l10n.phoneNumber,
                style: labelLargeStyle,
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
      case RegisterErrorStatus.validationFailed:
        return l10n.registerValidationFailed;
      case RegisterErrorStatus.emailAlreadyInUse:
        return l10n.emailAlreadyInUse;
      case RegisterErrorStatus.unknown:
        return l10n.registerErrorUnknown;
    }
  }
}
