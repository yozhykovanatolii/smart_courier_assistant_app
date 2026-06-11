import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/feature/home/cubit/home_state.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';

class ErrorOrdersSection extends StatelessWidget {
  final HomeErrorType? errorType;

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
            color: Color(0xFF9CA3BF),
          ),
          Text(
            _mapHomeErrorTypeToMessage(context, errorType),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF9CA3BF),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  String _mapHomeErrorTypeToMessage(
    BuildContext context,
    HomeErrorType? errorType,
  ) {
    final l10n = S.of(context);

    if (errorType == null) return '';

    switch (errorType) {
      case HomeErrorType.routeNotFound:
        return l10n.invalidEmail;
      case HomeErrorType.ordersNotFound:
        return l10n.userDisabled;
      case HomeErrorType.unknown:
        return l10n.wrongPassword;
    }
  }
}
