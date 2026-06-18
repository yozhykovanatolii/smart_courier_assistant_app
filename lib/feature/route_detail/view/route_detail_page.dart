import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/data/models/route_model.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/widgets/arrow_back_button.dart';

@RoutePage()
class RouteDetailPage extends StatelessWidget {
  final RouteModel route;

  const RouteDetailPage({
    super.key,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(
          horizontal: 11,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 11,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ArrowBackButton(),
                Text(
                  S.of(context).routeDetail,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(width: 32),
              ],
            ),
            Text(
              'Route #${route.routeId}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '🗓 ${route.date.day}.${route.date.month}.${route.date.year}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '📦 10 orders | ⚠️ 2 delayed',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const Divider(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
