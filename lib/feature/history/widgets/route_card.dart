import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/data/models/route_model.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';
import 'package:smart_courier_assistant_app/router/app_router.gr.dart';
import 'package:smart_courier_assistant_app/ui/theme/app_colors.dart';

class RouteCard extends StatelessWidget {
  final RouteModel route;

  const RouteCard({
    super.key,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    final bodyLargeStyle = Theme.of(context).textTheme.bodyLarge;

    return GestureDetector(
      onTap: () {
        context.router.push(RouteDetailRoute(route: route));
      },
      child: Card(
        elevation: 2,
        color: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                route.routeId,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 10),
              _RouteInfomationSection(
                icon: const Icon(
                  Icons.event,
                  size: 18,
                  color: AppColors.blue600,
                ),
                text: Text(
                  "${route.date.day}.${route.date.month}.${route.date.year}",
                  style: bodyLargeStyle?.copyWith(
                    color: AppColors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _RouteInfomationSection(
                    icon: const Icon(
                      Icons.inventory_2,
                      size: 18,
                      color: AppColors.green,
                    ),
                    text: Text(
                      S.of(context).routeOrdersCount(10),
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  _RouteInfomationSection(
                    icon: const Icon(
                      Icons.error_outline,
                      size: 18,
                      color: AppColors.red,
                    ),
                    text: Text(
                      S.of(context).routeDelayedOrdersCount(2),
                      style: bodyLargeStyle?.copyWith(
                        color: AppColors.red,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RouteInfomationSection extends StatelessWidget {
  final Widget text;
  final Widget icon;

  const _RouteInfomationSection({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 4,
      children: [text, icon],
    );
  }
}
