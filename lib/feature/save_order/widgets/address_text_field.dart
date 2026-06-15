import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/feature/save_order/cubit/save_order_cubit.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_text_field.dart';
import 'package:smart_courier_assistant_app/validation/address_validator.dart';

class AddressTextField extends StatelessWidget {
  final TextEditingController? addressController;

  const AddressTextField({
    super.key,
    this.addressController,
  });

  @override
  Widget build(BuildContext context) {
    final addressInputError = context
        .select<SaveOrderCubit, AddressInputError?>(
          (saveOrderCubit) =>
              saveOrderCubit.state.addressValidator.displayError,
        );
    final errorMessage = _mapAddressInputErrorToString(
      context,
      addressInputError,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        AppTextField(
          controller: addressController,
          hintText: 'London, Baker Street 221B',
          onChanged: context.read<SaveOrderCubit>().setOrderAddress,
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

  String? _mapAddressInputErrorToString(
    BuildContext context,
    AddressInputError? addressInputError,
  ) {
    final l10n = S.of(context);
    if (addressInputError == null) return null;

    switch (addressInputError) {
      case AddressInputError.empty:
        return l10n.addressEmpty;
      case AddressInputError.invalidFormat:
        return l10n.addressInvalidFormat;
    }
  }
}
