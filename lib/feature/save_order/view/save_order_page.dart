import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/feature/save_order/cubit/save_order_cubit.dart';
import 'package:smart_courier_assistant_app/feature/save_order/widgets/widgets.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/theme/app_colors.dart';

class SaveOrderPage extends StatelessWidget {
  const SaveOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SaveOrderCubit(),
      child: const _SaveOrderView(),
    );
  }
}

class _SaveOrderView extends StatelessWidget {
  const _SaveOrderView();

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final labelLargeStyle = Theme.of(context).textTheme.labelLarge;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 3.5,
                width: 50,
                decoration: const BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const HeaderSection(isEditing: true),
            const SizedBox(height: 20),
            Text(
              l10n.address,
              style: labelLargeStyle,
            ),
            const SizedBox(height: 5),
            const AddressTextField(),
            const SizedBox(height: 20),
            Text(
              l10n.client,
              style: labelLargeStyle,
            ),
            const SizedBox(height: 5),
            const ClientFullNameTextField(),
            const SizedBox(height: 20),
            Text(
              l10n.contactPhone,
              style: labelLargeStyle,
            ),
            const SizedBox(height: 5),
            const ClientPhoneNumberTextField(),
            const SizedBox(height: 10),
            const OrderDeliveryTimeSection(),
            const SizedBox(height: 10),
            Text(
              l10n.category,
              style: labelLargeStyle,
            ),
            const SizedBox(height: 5),
            const OrderCategoryListChoice(),
            const SizedBox(height: 45),
            const SaveOrderButton(),
          ],
        ),
      ),
    );
  }
}
