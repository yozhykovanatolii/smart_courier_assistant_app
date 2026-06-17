import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/feature/home/bloc/home_bloc.dart';
import 'package:smart_courier_assistant_app/ui/theme/app_colors.dart';

class RecommendationRouteSection extends StatelessWidget {
  const RecommendationRouteSection({super.key});

  @override
  Widget build(BuildContext context) {
    final recommendation = context.select(
      (HomeBloc homeCubit) => homeCubit.state.routeRecommendation,
    );
    if (recommendation.isEmpty) {
      return const SizedBox.shrink();
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F2FD),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.auto_awesome_rounded,
            color: AppColors.blue600,
            size: 20,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              recommendation,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 13.5,
                color: AppColors.blue600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
