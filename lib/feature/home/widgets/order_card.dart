import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/data/models/order_model.dart';
import 'package:smart_courier_assistant_app/feature/home/cubit/home_cubit.dart';
import 'package:smart_courier_assistant_app/feature/save_order/view/save_order_page.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/extensions/delivery_risk_extension.dart';
import 'package:smart_courier_assistant_app/ui/theme/app_colors.dart';
import 'package:smart_courier_assistant_app/ui/ui_helper.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_elevated_button.dart';

class OrderCard extends StatelessWidget {
  final int index;
  final OrderModel order;

  const OrderCard({
    super.key,
    required this.index,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 32),
            const SizedBox(width: 5),
            Expanded(child: _OrderCardContent(order)),
          ],
        ),
        Positioned(
          top: 0,
          left: 0,
          child: _IndexCircle(index: index),
        ),
        const Positioned(
          top: 40,
          left: 15,
          bottom: 0,
          child: _DottedLine(),
        ),
      ],
    );
  }
}

class _IndexCircle extends StatelessWidget {
  final int index;

  const _IndexCircle({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: const BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        '$index',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _DottedLine extends StatelessWidget {
  const _DottedLine();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        20,
        (_) => Container(
          width: 2,
          height: 5,
          color: Colors.blue,
        ),
      ),
    );
  }
}

class _OrderCardContent extends StatelessWidget {
  final OrderModel order;

  const _OrderCardContent(this.order);

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;
    final deliveryRiskColor = order.deliveryRisk.mapDeliveryRiskToColor();
    final deliveryRiskText = order.deliveryRisk.mapDeliveryRiskToText(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _CardHeaderSection(order),
        if (deliveryRiskColor != null && deliveryRiskText != null)
          Text(
            'ETA ${order.plannedEta.hour}:${order.plannedEta.minute.toString().padLeft(2, '0')} • $deliveryRiskText',
            style: bodyLarge?.copyWith(
              color: deliveryRiskColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        const SizedBox(height: 5),
        Text(
          order.clientFullName,
          style: bodyLarge?.copyWith(
            color: AppColors.grey,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 10,
          children: order.status == 'Delivered'
              ? []
              : [
                  Expanded(
                    child: _OrderActionButton(
                      text: l10n.done,
                      backgroundColor: scaffoldBackgroundColor,
                      border: Border.all(
                        color: Colors.green,
                        width: 1.5,
                      ),
                      textColor: Colors.green,
                      onPressed: order.deliveryRisk == DeliveryRisk.unknown
                          ? null
                          : () {},
                    ),
                  ),
                  Expanded(
                    child: _OrderActionButton(
                      text: l10n.call,
                      backgroundColor: Colors.blue,
                      onPressed: () {
                        context.read<HomeCubit>().openCallDialer(
                          order.clientPhoneNumber,
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: _OrderActionButton(
                      text: l10n.chat,
                      backgroundColor: Colors.orange,
                      onPressed: () {
                        context.read<HomeCubit>().openUserMessanger(
                          order.clientPhoneNumber,
                        );
                      },
                    ),
                  ),
                ],
        ),
        const Divider(),
      ],
    );
  }
}

class _CardHeaderSection extends StatelessWidget {
  final OrderModel order;

  const _CardHeaderSection(this.order);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            order.address,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        GestureDetector(
          onTap: order.status == 'Delivered'
              ? null
              : () {
                  UiHelper.showModalSheet(
                    context,
                    SaveOrderPage(order: order),
                  );
                },
          child: Icon(
            Icons.keyboard_arrow_right,
            size: 30,
            color: Colors.grey[500],
          ),
        ),
      ],
    );
  }
}

class _OrderActionButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Border? border;
  final Function()? onPressed;
  final Color textColor;

  const _OrderActionButton({
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    this.border,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      onPressed: onPressed,
      padding: const EdgeInsetsGeometry.symmetric(vertical: 10),
      backgroundColor: backgroundColor,
      border: border,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 12.3,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
