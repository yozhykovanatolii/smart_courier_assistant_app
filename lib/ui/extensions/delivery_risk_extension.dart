import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/domain/entity/order_entity.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/theme/app_colors.dart';

extension DeliveryRiskExtension on DeliveryRisk {
  Color? mapDeliveryRiskToColor() {
    switch (this) {
      case DeliveryRisk.atRisk:
        return AppColors.yellow;
      case DeliveryRisk.onTime:
        return AppColors.green;
      case DeliveryRisk.delayed:
        return AppColors.red;
      case DeliveryRisk.unknown:
        return null;
    }
  }

  String? mapDeliveryRiskToText(BuildContext context) {
    final l10n = S.of(context);
    switch (this) {
      case DeliveryRisk.atRisk:
        return l10n.atRisk;
      case DeliveryRisk.onTime:
        return l10n.onTime;
      case DeliveryRisk.delayed:
        return l10n.delayed;
      case DeliveryRisk.unknown:
        return null;
    }
  }
}
