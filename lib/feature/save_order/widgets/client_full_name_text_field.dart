import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/feature/save_order/cubit/save_order_cubit.dart';
import 'package:smart_courier_assistant_app/ui/extensions/full_name_input_error_extension.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_text_field.dart';
import 'package:smart_courier_assistant_app/validation/full_name_validator.dart';

class ClientFullNameTextField extends StatelessWidget {
  const ClientFullNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final fullNameInputError = context
        .select<SaveOrderCubit, FullNameInputError?>(
          (saveOrderCubit) =>
              saveOrderCubit.state.clientFullNameValidator.displayError,
        );
    final errorMessage = fullNameInputError.mapFullNameInputErrorToString(
      context,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        AppTextField(
          hintText: 'John Dou',
          onChanged: context.read<SaveOrderCubit>().setClientFullName,
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
