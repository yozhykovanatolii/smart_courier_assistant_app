import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/feature/save_order/cubit/save_order_cubit.dart';
import 'package:smart_courier_assistant_app/ui/extensions/full_name_input_error_extension.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_text_field.dart';
import 'package:smart_courier_assistant_app/validation/full_name_validator.dart';

class ClientFullNameTextField extends StatelessWidget {
  final TextEditingController? clientFullNameController;

  const ClientFullNameTextField({
    super.key,
    this.clientFullNameController,
  });

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

    return AppTextField(
      controller: clientFullNameController,
      hintText: 'John Dou',
      onChanged: context.read<SaveOrderCubit>().setClientFullName,
      errorMessage: errorMessage,
    );
  }
}
