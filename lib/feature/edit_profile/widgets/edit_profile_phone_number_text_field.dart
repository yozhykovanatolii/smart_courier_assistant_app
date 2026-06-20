import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/feature/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:smart_courier_assistant_app/ui/extensions/phone_number_input_error_extension.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_text_field.dart';
import 'package:smart_courier_assistant_app/validation/phone_number_validator.dart';

class EditProfilePhoneNumberTextField extends StatelessWidget {
  final TextEditingController controller;

  const EditProfilePhoneNumberTextField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final phoneNumberInputError = context
        .select<EditProfileCubit, PhoneNumberInputError?>(
          (editProfileCubit) =>
              editProfileCubit.state.phoneNumberValidator.displayError,
        );
    final errorMessage = phoneNumberInputError.mapPhoneNumberInputErrorToString(
      context,
    );

    return AppTextField(
      controller: controller,
      hintText: '+380991234567',
      onChanged: context.read<EditProfileCubit>().setProfilePhoneNumber,
      errorMessage: errorMessage,
    );
  }
}
