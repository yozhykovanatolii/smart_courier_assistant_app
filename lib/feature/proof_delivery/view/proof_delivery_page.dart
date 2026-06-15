import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/feature/proof_delivery/widgets/widgets.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/theme/app_colors.dart';

class ProofDeliveryPage extends StatelessWidget {
  final String orderId;

  const ProofDeliveryPage({
    super.key,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    final labelLargeStyle = Theme.of(context).textTheme.labelLarge;
    final l10n = S.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                height: 3.5,
                width: 50,
                decoration: const BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const HeaderProofDelivery(),
            const SizedBox(height: 20),
            Text(
              l10n.comment,
              style: labelLargeStyle,
            ),
            const SizedBox(height: 5),
            const CommentTextField(),
            const SizedBox(height: 20),
            Text(
              l10n.photo,
              style: labelLargeStyle,
            ),
            const SizedBox(height: 15),
            const PhotoListView(),
            const SizedBox(height: 80),
            const ConfirmButton(),
          ],
        ),
      ),
    );
  }
}
