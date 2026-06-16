import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/feature/home/cubit/home_cubit.dart';
import 'package:smart_courier_assistant_app/feature/home/cubit/home_state.dart';
import 'package:smart_courier_assistant_app/feature/home/widgets/error_orders_section.dart';
import 'package:smart_courier_assistant_app/feature/home/widgets/header_sheet_section.dart';
import 'package:smart_courier_assistant_app/feature/home/widgets/order_card.dart';
import 'package:smart_courier_assistant_app/feature/home/widgets/recommendation_route_section.dart';
import 'package:smart_courier_assistant_app/ui/theme/app_colors.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_progress_indicator.dart';

class OrdersDraggableSheet extends StatelessWidget {
  const OrdersDraggableSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.25,
      minChildSize: 0.25,
      maxChildSize: 0.9,
      snap: true,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          child: SafeArea(
            top: false,
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                final orderStatus = state.orderStatus;
                if (orderStatus == HomeStatus.failure) {
                  return ErrorOrdersSection(
                    errorType: state.errorType,
                  );
                }
                if (orderStatus == HomeStatus.success) {
                  final activeOrders = state.orders;
                  return ListView.builder(
                    controller: scrollController,
                    itemCount: activeOrders.length + 1,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 20,
                    ),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 3.5,
                              width: 50,
                              decoration: const BoxDecoration(
                                color: AppColors.grey,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            const RecommendationRouteSection(),
                            const SizedBox(height: 15),
                            const HeaderSheetSection(),
                            const SizedBox(height: 15),
                          ],
                        );
                      }
                      final order = activeOrders[index - 1];
                      return OrderCard(
                        index: index,
                        order: order,
                      );
                    },
                  );
                }
                return const Center(
                  child: AppProgressIndicator(
                    scale: 1.08,
                    color: Colors.blue,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
