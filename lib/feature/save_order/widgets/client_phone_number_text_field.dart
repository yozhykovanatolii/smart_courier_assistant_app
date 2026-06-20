import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/feature/save_order/cubit/save_order_cubit.dart';
import 'package:smart_courier_assistant_app/ui/extensions/phone_number_input_error_extension.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_text_field.dart';
import 'package:smart_courier_assistant_app/validation/phone_number_validator.dart';

class ClientPhoneNumberTextField extends StatelessWidget {
  final TextEditingController? clientPhoneNumberController;

  const ClientPhoneNumberTextField({
    super.key,
    this.clientPhoneNumberController,
  });

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

    return AppTextField(
      controller: clientPhoneNumberController,
      hintText: '+380991234567',
      onChanged: context.read<SaveOrderCubit>().setClientPhoneNumber,
      errorMessage: errorMessage,
      keyboardType: TextInputType.phone,
    );
  }
}
