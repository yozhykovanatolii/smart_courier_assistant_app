import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/feature/save_order/cubit/save_order_cubit.dart';
import 'package:smart_courier_assistant_app/localization/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/ui_helper.dart';
import 'package:smart_courier_assistant_app/ui/widgets/information_dialog_box.dart';

class IconDeleteOrderButton extends StatelessWidget {
  final String orderId;

  const IconDeleteOrderButton({
    super.key,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return IconButton(
      onPressed: () {
        UiHelper.showConfirmDialog(
          context,
          BlocProvider.value(
            value: context.read<SaveOrderCubit>(),
            child: InformationDialogBox(
              title: l10n.deletingOrder,
              description: l10n.areYouGoingToDeleteOrder,
              onClickActionButton: () {
                context.read<SaveOrderCubit>().deleteOrder(orderId);
              },
            ),
          ),
        );
      },
      icon: const Icon(
        Icons.delete,
        color: Colors.red,
        size: 25,
      ),
    );
  }
}
