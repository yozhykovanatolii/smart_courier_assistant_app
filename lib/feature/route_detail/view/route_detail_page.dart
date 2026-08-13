import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_courier_assistant_app/bloc/app/app_bloc.dart';
import 'package:smart_courier_assistant_app/bloc/app/app_state.dart';
import 'package:smart_courier_assistant_app/domain/entity/route_entity.dart';
import 'package:smart_courier_assistant_app/feature/route_detail/cubit/route_detail_cubit.dart';
import 'package:smart_courier_assistant_app/feature/route_detail/cubit/route_detail_state.dart';
import 'package:smart_courier_assistant_app/feature/route_detail/widgets/widgets.dart';
import 'package:smart_courier_assistant_app/localization/generated/l10n.dart';
import 'package:smart_courier_assistant_app/router/app_router.gr.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_progress_indicator.dart';
import 'package:smart_courier_assistant_app/ui/widgets/arrow_back_button.dart';
import 'package:smart_courier_assistant_app/ui/widgets/error_orders_section.dart';

@RoutePage()
class RouteDetailPage extends StatelessWidget {
  final RouteEntity route;

  const RouteDetailPage({
    super.key,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        return GetIt.I<RouteDetailCubit>()..fetchAllRouteOrders(route.routeId);
      },
      child: _RouteDetailView(route),
    );
  }
}

class _RouteDetailView extends StatelessWidget {
  final RouteEntity route;

  const _RouteDetailView(this.route);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          if (state is AppUnauthenticatedState) {
            context.router.replace(const LoginRoute());
          }
        },
        child: SafeArea(
          minimum: const EdgeInsets.symmetric(
            horizontal: 11,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 11,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ArrowBackButton(),
                  Text(
                    S.of(context).routeDetail,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(width: 32),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                S.of(context).routeIdText(route.routeId),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '🗓 ${route.createAt.day}.${route.createAt.month}.${route.createAt.year}',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                S.of(context).ordersAndDelayedOrdersCount(10, 2),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 17,
                ),
              ),
              const Divider(),
              const SizedBox(height: 10),
              Expanded(
                child: BlocBuilder<RouteDetailCubit, RouteDetailState>(
                  builder: (context, state) {
                    if (state is RouteDetailFailureState) {
                      final errorMessage = _mapRouteDetailErrorTypeToMessage(
                        context,
                        state.routeDetailErrorType,
                      );
                      return ErrorOrdersSection(errorMessage: errorMessage);
                    }
                    if (state is RouteDetailSuccessState) {
                      final routeOrders = state.routeOrders;
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return RouteOrderCard(
                            index: index + 1,
                            order: routeOrders[index],
                          );
                        },
                        itemCount: routeOrders.length,
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
      ),
    );
  }

  String _mapRouteDetailErrorTypeToMessage(
    BuildContext context,
    RouteDetailErrorType routeDetailErrorType,
  ) {
    final l10n = S.of(context);

    switch (routeDetailErrorType) {
      case RouteDetailErrorType.invalidCredentials:
        return l10n.invalidCredential;
      case RouteDetailErrorType.dataNotFound:
        return l10n.dataNotFound;
      case RouteDetailErrorType.unknown:
        return l10n.somethingWentWrong;
    }
  }
}
