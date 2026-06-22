import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/feature/save_order/cubit/save_order_cubit.dart';
import 'package:smart_courier_assistant_app/localization/generated/l10n.dart';
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

    return AppTextField(
      controller: addressController,
      hintText: 'London, Baker Street 221B',
      onChanged: context.read<SaveOrderCubit>().setOrderAddress,
      errorMessage: errorMessage,
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
