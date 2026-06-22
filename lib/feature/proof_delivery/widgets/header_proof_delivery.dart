import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/localization/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/widgets/arrow_back_button.dart';

class HeaderProofDelivery extends StatelessWidget {
  const HeaderProofDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const ArrowBackButton(),
        Text(
          S.of(context).proofOfDelivery,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(width: 48),
      ],
    );
  }
}
