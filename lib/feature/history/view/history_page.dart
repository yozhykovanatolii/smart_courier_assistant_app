import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_courier_assistant_app/feature/history/cubit/history_cubit.dart';
import 'package:smart_courier_assistant_app/feature/history/cubit/history_state.dart';
import 'package:smart_courier_assistant_app/feature/history/widgets/widgets.dart';
import 'package:smart_courier_assistant_app/localization/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_progress_indicator.dart';
import 'package:smart_courier_assistant_app/ui/widgets/arrow_back_button.dart';

@RoutePage()
class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<HistoryCubit>()..fetchAllCourierRoutes(),
      child: const _HistoryView(),
    );
  }
}

class _HistoryView extends StatelessWidget {
  const _HistoryView();

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(
          horizontal: 11,
          vertical: 20,
        ),
        child: Column(
          children: [
            Row(
              spacing: 11,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ArrowBackButton(),
                Text(
                  l10n.myRoutes,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(width: 32),
              ],
            ),
            const SizedBox(height: 40),
            Expanded(
              child: BlocBuilder<HistoryCubit, HistoryState>(
                builder: (context, state) {
                  if (state is HistoryFailureState) {
                    return ErrorRoutesSection(
                      errorType: state.historyErrorType,
                    );
                  }
                  if (state is HistorySuccessState) {
                    final routes = state.routes;
                    return ListView.builder(
                      itemCount: routes.length,
                      itemBuilder: (context, index) {
                        return RouteCard(
                          route: routes[index],
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
          ],
        ),
      ),
    );
  }
}
