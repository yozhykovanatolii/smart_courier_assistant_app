import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/data/models/order_model.dart';
import 'package:smart_courier_assistant_app/ui/extensions/delivery_risk_extension.dart';
import 'package:smart_courier_assistant_app/ui/pdf_generator.dart';

class RouteOrderCard extends StatelessWidget {
  final int index;
  final OrderModel order;

  const RouteOrderCard({
    super.key,
    required this.index,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        Column(
          children: [
            Container(
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
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: 2,
              height: 110,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      10,
                      (index) => Container(
                        width: 2,
                        height: constraints.maxHeight / 30,
                        color: Colors.blue,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        Expanded(child: _OrderCardContent(order)),
      ],
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
          order.address,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'Deliver by ${order.plannedEta.hour}:${order.plannedEta.minute.toString().padLeft(2, '0')} • ETA ${order.plannedEta.hour}:${order.plannedEta.minute.toString().padLeft(2, '0')} • ${order.deliveryRisk.mapDeliveryRiskToText(context)}',
          style: const TextStyle(
            color: Color(0xFF6E6E73),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          order.status,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
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
            'Order #${order.id}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xFF1C1C1E),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            await PdfGenerator.generateOrderReportPdf(order, context);
          },
          child: Icon(
            Icons.save,
            size: 30,
            color: Colors.grey[500],
          ),
        ),
      ],
    );
  }
}
