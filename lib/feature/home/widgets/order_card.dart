import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/data/models/order_model.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';
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
          height: 6,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _CardHeaderSection(order),
        Text(
          'ETA ${order.plannedEta.hour}:${order.plannedEta.minute.toString().padLeft(2, '0')} • ${order.deliveryRisk}',
          style: const TextStyle(
            //color: Color(order.deliveryRisk),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          order.clientFullName,
          style: const TextStyle(
            color: Color(0xFF6E6E73),
            fontSize: 15,
            fontWeight: FontWeight.w500,
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
                      text: S.of(context).done,
                      backgroundColor: Theme.of(
                        context,
                      ).scaffoldBackgroundColor,
                      border: Border.all(
                        color: Colors.green,
                        width: 1.5,
                      ),
                      textColor: Colors.green,
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    child: _OrderActionButton(
                      text: S.of(context).call,
                      backgroundColor: Colors.blue,
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    child: _OrderActionButton(
                      text: S.of(context).chat,
                      backgroundColor: Colors.orange,
                      onPressed: () {},
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
          onTap: order.status == 'Delivered' ? null : () {},
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
