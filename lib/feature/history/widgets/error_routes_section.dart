import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/feature/history/cubit/history_state.dart';
import 'package:smart_courier_assistant_app/localization/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/theme/app_colors.dart';

class ErrorRoutesSection extends StatelessWidget {
  final HistoryErrorType errorType;

  const ErrorRoutesSection({
    super.key,
    required this.errorType,
  });

  @override
  Widget build(BuildContext context) {
    final errorMessage = _mapHistoryErrorTypeToMessage(context, errorType);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.route,
            size: 50,
            color: AppColors.grey600,
          ),
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  String _mapHistoryErrorTypeToMessage(
    BuildContext context,
    HistoryErrorType errorType,
  ) {
    final l10n = S.of(context);

    switch (errorType) {
      case HistoryErrorType.invalidCredentials:
        return l10n.invalidCredential;
      case HistoryErrorType.dataNotFound:
        return l10n.dataNotFound;
      case HistoryErrorType.unknown:
        return l10n.somethingWentWrong;
    }
  }
}
