import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/localization/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/widgets/arrow_back_button.dart';

class HeaderSection extends StatelessWidget {
  final Widget? iconDeleteOrderButton;

  const HeaderSection({
    super.key,
    this.iconDeleteOrderButton,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const ArrowBackButton(),
        Text(
          S.of(context).saveOrder,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        iconDeleteOrderButton ?? const SizedBox(width: 32),
      ],
    );
  }
}
