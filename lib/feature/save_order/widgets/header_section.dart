import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/widgets/arrow_back_button.dart';

class HeaderSection extends StatelessWidget {
  final bool isEditing;
  const HeaderSection({
    super.key,
    required this.isEditing,
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
        isEditing
            ? IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 25,
                ),
              )
            : const SizedBox(width: 32),
      ],
    );
  }
}
