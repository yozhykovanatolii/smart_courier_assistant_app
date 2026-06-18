import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/data/models/route_model.dart';
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
      onTap: () {},
      child: Card(
        elevation: 2,
        color: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                route.routeId,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const Icon(
                    Icons.event,
                    size: 18,
                    color: AppColors.blue600,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "${route.date.day}.${route.date.month}.${route.date.year}",
                    style: bodyLargeStyle?.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Icon(
                    Icons.inventory_2,
                    size: 18,
                    color: AppColors.green,
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    "10 orders",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Icon(
                    Icons.error_outline,
                    size: 18,
                    color: AppColors.red,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "2 delayed",
                    style: bodyLargeStyle?.copyWith(
                      color: AppColors.red,
                      fontSize: 14,
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
