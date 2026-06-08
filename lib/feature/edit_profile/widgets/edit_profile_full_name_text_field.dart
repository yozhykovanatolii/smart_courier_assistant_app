import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/feature/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:smart_courier_assistant_app/ui/extensions/full_name_input_error_extension.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_text_field.dart';
import 'package:smart_courier_assistant_app/validation/full_name_validator.dart';

class EditProfileFullNameTextField extends StatelessWidget {
  final TextEditingController controller;

  const EditProfileFullNameTextField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final fullNameInputError = context
        .select<EditProfileCubit, FullNameInputError?>(
          (editProfileCubit) =>
              editProfileCubit.state.fullNameValidator.displayError,
        );
    final errorMessage = fullNameInputError.mapFullNameInputErrorToString(
      context,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        AppTextField(
          controller: controller,
          hintText: 'John Dou',
          onChanged: context.read<EditProfileCubit>().setProfileFullName,
          isValid: errorMessage == null,
        ),
        if (errorMessage != null)
          Text(
            errorMessage,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.red,
            ),
          ),
      ],
    );
  }
}
