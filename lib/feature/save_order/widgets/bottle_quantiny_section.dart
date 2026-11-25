import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/feature/save_order/cubit/save_order_cubit.dart';
import 'package:smart_courier_assistant_app/localization/generated/l10n.dart';

class BottleQuantinySection extends StatelessWidget {
  const BottleQuantinySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).bottleQuantityText,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
          children: [
            _QuantityActionButton(
              isIncreasing: false,
            ),
            _DistanceResultSection(),
            _QuantityActionButton(),
          ],
        ),
      ],
    );
  }
}

class _DistanceResultSection extends StatelessWidget {
  const _DistanceResultSection();

  @override
  Widget build(BuildContext context) {
    final bottleQuantity = context.select(
      (SaveOrderCubit saveOrderCubit) => saveOrderCubit.state.bottleQuantity,
    );
    return Text(
      '$bottleQuantity',
      style: TextStyle(
        fontSize: MediaQuery.textScalerOf(context).scale(18),
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _QuantityActionButton extends StatelessWidget {
  final bool isIncreasing;

  const _QuantityActionButton({
    this.isIncreasing = true,
  });

  @override
  Widget build(BuildContext context) {
    final saveOrderCubit = context.read<SaveOrderCubit>();
    return FloatingActionButton.small(
      onPressed: () {
        isIncreasing
            ? saveOrderCubit.increaseBottleQuantity()
            : saveOrderCubit.decreaseBottleQuantity();
      },
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      child: Icon(isIncreasing ? Icons.add : Icons.remove),
    );
  }
}
