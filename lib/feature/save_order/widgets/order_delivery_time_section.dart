import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/feature/save_order/cubit/save_order_cubit.dart';
import 'package:smart_courier_assistant_app/ui/ui_helper.dart';

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
    final deliveryBy = context.select(
      (SaveOrderCubit saveOrderCubit) => saveOrderCubit.state.deliveryBy,
    );
    return TextButton(
      onPressed: () async {
        final saveOrderCubit = context.read<SaveOrderCubit>();
        final TimeOfDay newSelectedTime = await UiHelper.showTimePickerDialog(
          context: context,
          initialTime: TimeOfDay(
            hour: deliveryBy.hour,
            minute: deliveryBy.minute,
          ),
        );
        saveOrderCubit.chooseDeliveryTime(
          newSelectedTime.hour,
          newSelectedTime.minute,
        );
      },
      child: Text(
        '${deliveryBy.hour}:${deliveryBy.minute.toString().padLeft(2, '0')}',
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
