import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:smart_courier_assistant_app/feature/verification/cubit/verification_cubit.dart';
import 'package:smart_courier_assistant_app/localization/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/theme/app_colors.dart';
import 'package:smart_courier_assistant_app/validation/otp_code_validator.dart';

class VerificationCodeTextField extends StatelessWidget {
  const VerificationCodeTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final optCodeInputError = context
        .select<VerificationCubit, OptCodeInputError?>(
          (verificationCubit) =>
              verificationCubit.state.otpCodeValidator.displayError,
        );
    final optCodeError = _mapOptCodeValidationError(
      context,
      optCodeInputError,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        MaterialPinField(
          length: 6,
          onChanged: (optCode) {
            context.read<VerificationCubit>().setOptCode(optCode);
          },
          theme: const MaterialPinTheme(
            cellSize: Size(44, 56),
            shape: MaterialPinShape.underlined,
            cursorColor: AppColors.blue700,
            focusedBorderColor: AppColors.blue700,
          ),
        ),
        if (optCodeError != null)
          Text(
            optCodeError,
            style: const TextStyle(
              color: Colors.red,
            ),
          ),
      ],
    );
  }

  String? _mapOptCodeValidationError(
    BuildContext context,
    OptCodeInputError? optCodeInputError,
  ) {
    final l10n = S.of(context);

    if (optCodeInputError == null) return null;

    switch (optCodeInputError) {
      case OptCodeInputError.empty:
        return l10n.optCodeEmpty;
      case OptCodeInputError.tooShort:
        return l10n.optCodeLengthLessSix;
    }
  }
}
