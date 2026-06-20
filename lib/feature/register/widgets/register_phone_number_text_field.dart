import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/feature/register/cubit/register_cubit.dart';
import 'package:smart_courier_assistant_app/ui/extensions/phone_number_input_error_extension.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_text_field.dart';
import 'package:smart_courier_assistant_app/validation/phone_number_validator.dart';

class RegisterPhoneNumberTextField extends StatelessWidget {
  const RegisterPhoneNumberTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneNumberInputError = context
        .select<RegisterCubit, PhoneNumberInputError?>(
          (registerCubit) =>
              registerCubit.state.phoneNumberValidator.displayError,
        );
    final errorMessage = phoneNumberInputError.mapPhoneNumberInputErrorToString(
      context,
    );

    return AppTextField(
      hintText: '+380991234567',
      onChanged: context.read<RegisterCubit>().setRegisterPhoneNumber,
      errorMessage: errorMessage,
      keyboardType: TextInputType.phone,
    );
  }
}
