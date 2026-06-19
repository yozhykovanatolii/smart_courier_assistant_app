import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/data/models/order_model.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/extensions/delivery_risk_extension.dart';
import 'package:smart_courier_assistant_app/ui/pdf_generator.dart';
import 'package:smart_courier_assistant_app/ui/theme/app_colors.dart';

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
    final l10n = S.of(context);
    final bodyLargeStyle = Theme.of(context).textTheme.bodyLarge;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _CardHeaderSection(order),
        Text(
          order.address,
          style: bodyLargeStyle?.copyWith(
            fontSize: 16,
          ),
        ),
        Text(
          l10n.deliverByEtaAndRisk(
            order.deliveryBy.hour,
            order.deliveryBy.minute.toString().padLeft(2, '0'),
            order.plannedEta.hour,
            order.plannedEta.minute.toString().padLeft(2, '0'),
            order.deliveryRisk.mapDeliveryRiskToText(context) ?? l10n.unknown,
          ),
          style: bodyLargeStyle?.copyWith(
            color: AppColors.grey,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          order.status,
          style: bodyLargeStyle?.copyWith(
            fontSize: 16,
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
            S.of(context).orderId(order.id),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
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
