import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/feature/verification/cubit/cubit.dart';
import 'package:smart_courier_assistant_app/feature/verification/widgets/widgets.dart';
import 'package:smart_courier_assistant_app/localization/generated/l10n.dart';

@RoutePage()
class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VerificationCubit(
        email: 'gamet5560@gmail.com',
      ),
      child: const _VerificationView(),
    );
  }
}

class _VerificationView extends StatelessWidget {
  const _VerificationView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(
          top: 50,
          left: 24,
          right: 24,
        ),
        child: Column(
          children: [
            Text(
              S.of(context).verifyYourEmail,
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
    );
  }
}
