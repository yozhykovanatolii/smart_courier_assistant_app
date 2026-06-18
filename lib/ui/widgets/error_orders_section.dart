import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/ui/theme/app_colors.dart';

class ErrorOrdersSection extends StatelessWidget {
  final String errorMessage;

  const ErrorOrdersSection({
    super.key,
    required this.errorMessage,
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
            errorMessage,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
