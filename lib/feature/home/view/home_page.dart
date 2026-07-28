import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_courier_assistant_app/feature/home/bloc/home_bloc.dart';
import 'package:smart_courier_assistant_app/feature/home/bloc/home_event.dart';
import 'package:smart_courier_assistant_app/feature/home/bloc/home_state.dart';
import 'package:smart_courier_assistant_app/feature/home/widgets/widgets.dart';
import 'package:smart_courier_assistant_app/feature/save_order/view/save_order_page.dart';
import 'package:smart_courier_assistant_app/localization/generated/l10n.dart';
import 'package:smart_courier_assistant_app/router/app_router.gr.dart';
import 'package:smart_courier_assistant_app/ui/ui_helper.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<HomeBloc>(),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<HomeBloc, HomeState>(
        listenWhen: (previous, current) {
          return previous.userActionError != current.userActionError ||
              previous.routeOptimizationStatus !=
                  current.routeOptimizationStatus;
        },
        listener: (context, state) {
          final userActionError = state.userActionError;
          final optimizationStatus = state.routeOptimizationStatus;
          if (optimizationStatus == HomeStatus.loading) {
            UiHelper.showConfirmDialog(
              context,
              const RouteOptimizationDialog(),
            );
          }
          if (optimizationStatus == HomeStatus.success) {
            context.router.maybePop(context);
          }
          if (optimizationStatus == HomeStatus.failure) {
            UiHelper.showSnackBar(
              context: context,
              message: '',
              isErrorSnackBar: true,
            );
            context.router.maybePop(context);
          }
          if (userActionError != null) {
            final actionErrorMessage = _mapUserActionErrorToMessage(
              context,
              userActionError,
            );
            UiHelper.showSnackBar(
              context: context,
              message: actionErrorMessage,
              isErrorSnackBar: true,
            );
          }
        },
        child: Stack(
          children: [
            const GoogleMapSection(),
            Positioned(
              top: 50,
              left: 15,
              child: ActionFloatingButton(
                icon: Icons.menu,
                onPressed: () => context.router.push(const ProfileRoute()),
              ),
            ),
            Positioned(
              bottom: 300,
              right: 15,
              child: ActionFloatingButton(
                icon: Icons.add_circle,
                heroTag: 'AddOrder',
                onPressed: () {
                  UiHelper.showModalSheet(
                    context,
                    const SaveOrderPage(),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 225,
              right: 15,
              child: ActionFloatingButton(
                icon: Icons.gps_fixed,
                heroTag: 'GetUserLocation',
                onPressed: () =>
                    context.read<HomeBloc>().add(HomeLocationFetched()),
              ),
            ),
            const OrdersDraggableSheet(),
          ],
        ),
      ),
    );
  }

  String _mapUserActionErrorToMessage(
    BuildContext context,
    UserActionError userActionError,
  ) {
    final l10n = S.of(context);

    switch (userActionError) {
      case UserActionError.callUnavailable:
        return l10n.callUnavailable;
      case UserActionError.messageUnavailable:
        return l10n.messageUnavailable;
      case UserActionError.locationPermissionDenied:
        return l10n.locationPermissionDenied;
      case UserActionError.locationServiceDisabled:
        return l10n.locationServiceDisabled;
    }
  }
}
