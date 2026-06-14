import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/ui_helper.dart';
import 'package:smart_courier_assistant_app/ui/widgets/information_dialog_box.dart';

class IconDeleteOrderButton extends StatelessWidget {
  final String? orderId;

  const IconDeleteOrderButton({
    super.key,
    this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return IconButton(
      onPressed: () {
        UiHelper.showConfirmDialog(
          context,
          InformationDialogBox(
            title: l10n.deletingOrder,
            description: l10n.areYouGoingToDeleteOrder,
            onClickActionButton: () {},
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
