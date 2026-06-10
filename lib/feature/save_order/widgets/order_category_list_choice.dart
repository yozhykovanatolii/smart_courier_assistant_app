import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/feature/save_order/cubit/save_order_cubit.dart';
import 'package:smart_courier_assistant_app/feature/save_order/cubit/save_order_state.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/theme/app_colors.dart';

class OrderCategoryListChoice extends StatelessWidget {
  const OrderCategoryListChoice({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: SaveOrderCategory.values.length,
        itemBuilder: (context, index) {
          final category = SaveOrderCategory.values[index];
          return _CategoryCard(category: category);
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final SaveOrderCategory category;

  const _CategoryCard({
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final isCategorySelected = context.select<SaveOrderCubit, bool>(
      (saveOrderCubit) => saveOrderCubit.state.orderCategory == category,
    );
    return GestureDetector(
      onTap: () {
        context.read<SaveOrderCubit>().setOrderCategory(category);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
        decoration: BoxDecoration(
          color: isCategorySelected ? Colors.blue : AppColors.grey300,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            _mapSaveOrderCategoryToText(context, category),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 17,
              color: isCategorySelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  String _mapSaveOrderCategoryToText(
    BuildContext context,
    SaveOrderCategory orderCategory,
  ) {
    final l10n = S.of(context);

    switch (orderCategory) {
      case SaveOrderCategory.parcel:
        return l10n.parcel;
      case SaveOrderCategory.food:
        return l10n.food;
      case SaveOrderCategory.docs:
        return l10n.docs;
    }
  }
}
