import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/feature/proof_delivery/cubit/proof_delivery_cubit.dart';
import 'package:smart_courier_assistant_app/localization/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_text_field.dart';
import 'package:smart_courier_assistant_app/validation/courier_comment_validator.dart';

class CommentTextField extends StatelessWidget {
  const CommentTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final courierCommentValidator = context
        .select<ProofDeliveryCubit, CourierCommentValidator>(
          (saveOrderCubit) => saveOrderCubit.state.courierCommentValidator,
        );
    final errorMessage = _mapCourierCommentInputErrorToString(
      context,
      courierCommentValidator.displayError,
    );

    return AppTextField(
      padding: const EdgeInsets.symmetric(vertical: 16),
      maxLines: 3,
      minLines: 3,
      hintText: S.of(context).enterComment,
      onChanged: context.read<ProofDeliveryCubit>().editCourierComment,
      errorMessage: errorMessage,
      counterText: '${courierCommentValidator.value.length}/200',
    );
  }

  String? _mapCourierCommentInputErrorToString(
    BuildContext context,
    CourierCommentInputError? courierCommentInputError,
  ) {
    final l10n = S.of(context);
    if (courierCommentInputError == null) return null;

    switch (courierCommentInputError) {
      case CourierCommentInputError.empty:
        return l10n.addressEmpty;
      case CourierCommentInputError.lengthLessThanTwoHundred:
        return l10n.addressInvalidFormat;
    }
  }
}
