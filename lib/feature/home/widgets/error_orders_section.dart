import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/feature/home/bloc/home_state.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/theme/app_colors.dart';

class ErrorOrdersSection extends StatelessWidget {
  final OrderErrorType? errorType;

  const ErrorOrdersSection({
    super.key,
    required this.errorType,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.inventory_2,
            size: 50,
            color: AppColors.grey600,
          ),
          Text(
            _mapHomeErrorTypeToMessage(context, errorType),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  String _mapHomeErrorTypeToMessage(
    BuildContext context,
    OrderErrorType? errorType,
  ) {
    final l10n = S.of(context);

    if (errorType == null) return '';

    switch (errorType) {
      case OrderErrorType.userNotFound:
        return l10n.userNotFound;
      case OrderErrorType.routeNotFound:
        return l10n.routeNotFound;
      case OrderErrorType.ordersNotFound:
        return l10n.ordersNotFound;
      case OrderErrorType.unknown:
        return l10n.somethingWentWrong;
    }
  }
}
