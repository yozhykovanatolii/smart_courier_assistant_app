import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/feature/verification/cubit/verification_cubit.dart';
import 'package:smart_courier_assistant_app/localization/generated/l10n.dart';

class VerificationEmailText extends StatelessWidget {
  const VerificationEmailText({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final email = context.select<VerificationCubit, String?>(
      (verificationCubit) => verificationCubit.state.email,
    );
    return Text(
      l10n.sentCodeToEmail(email ?? l10n.unknown),
      textAlign: TextAlign.start,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
