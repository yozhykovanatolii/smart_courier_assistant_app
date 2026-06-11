import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';

class HeaderSheetSection extends StatelessWidget {
  const HeaderSheetSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).orders,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        const _OptimizeRouteButton(),
      ],
    );
  }
}

class _OptimizeRouteButton extends StatelessWidget {
  const _OptimizeRouteButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        spacing: 5,
        children: [
          const Icon(
            Icons.refresh,
            color: Colors.blue,
          ),
          Text(
            S.of(context).optimizeRoute,
            style: TextStyle(
              fontSize: MediaQuery.textScalerOf(context).scale(17),
              fontWeight: FontWeight.w600,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
