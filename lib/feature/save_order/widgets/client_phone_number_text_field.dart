import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/feature/save_order/cubit/save_order_cubit.dart';
import 'package:smart_courier_assistant_app/ui/extensions/phone_number_input_error_extension.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_text_field.dart';
import 'package:smart_courier_assistant_app/validation/phone_number_validator.dart';

class ClientPhoneNumberTextField extends StatelessWidget {
  const ClientPhoneNumberTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneNumberInputError = context
        .select<SaveOrderCubit, PhoneNumberInputError?>(
          (saveOrderCubit) =>
              saveOrderCubit.state.clientPhoneNumberValidator.displayError,
        );
    final errorMessage = phoneNumberInputError.mapPhoneNumberInputErrorToString(
      context,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        AppTextField(
          hintText: '+380991234567',
          onChanged: context.read<SaveOrderCubit>().setClientPhoneNumber,
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
