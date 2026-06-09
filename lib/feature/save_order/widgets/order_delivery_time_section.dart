import 'package:flutter/material.dart';

class OrderDeliveryTimeSection extends StatelessWidget {
  const OrderDeliveryTimeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Deliver by',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const _DeliveryTimeButton(),
      ],
    );
  }
}

class _DeliveryTimeButton extends StatelessWidget {
  const _DeliveryTimeButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {},
      child: Text(
        '15:07',
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
