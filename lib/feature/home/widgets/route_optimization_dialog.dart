import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/localization/generated/l10n.dart';

class RouteOptimizationDialog extends StatelessWidget {
  const RouteOptimizationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final textTheme = Theme.of(context).textTheme;

    return AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      content: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.optimizeRoute,
              style: textTheme.titleMedium?.copyWith(
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              l10n.routeOptimizationInProgress,
              textAlign: TextAlign.center,
              style: textTheme.bodyLarge?.copyWith(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 30),
            const _OptimizationProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

class _OptimizationProgressIndicator extends StatelessWidget {
  const _OptimizationProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: LinearProgressIndicator(
        color: Colors.blue,
        backgroundColor: Colors.grey[400],
        minHeight: 7,
      ),
    );
  }
}
