import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_courier_assistant_app/feature/save_order/cubit/save_order_cubit.dart';
import 'package:smart_courier_assistant_app/feature/save_order/cubit/save_order_state.dart';
import 'package:smart_courier_assistant_app/feature/save_order/widgets/widgets.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/theme/app_colors.dart';
import 'package:smart_courier_assistant_app/ui/ui_helper.dart';

class SaveOrderPage extends StatelessWidget {
  const SaveOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<SaveOrderCubit>(),
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

    return BlocListener<SaveOrderCubit, SaveOrderState>(
      listenWhen: (previous, current) {
        return previous.formStatus != current.formStatus;
      },
      listener: (context, state) {
        final formStatus = state.formStatus;
        if (formStatus == FormzSubmissionStatus.failure) {
          final errorMessage = _mapSaveOrderErrorStatusToString(
            context,
            state.saveOrderErrorType,
          );
          UiHelper.showSnackBar(
            context: context,
            message: errorMessage,
            isErrorSnackBar: true,
          );
        }
        if (state.formStatus == FormzSubmissionStatus.success) {
          UiHelper.showSnackBar(
            context: context,
            message: S.of(context).successSavingOrder,
          );
          context.router.maybePop();
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: const EdgeInsets.only(top: 170),
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
              const HeaderSection(
                iconDeleteOrderButton: IconDeleteOrderButton(),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
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
                  ],
                ),
              ),
              const SizedBox(height: 45),
              const SaveOrderButton(),
            ],
          ),
        ),
      ),
    );
  }

  String _mapSaveOrderErrorStatusToString(
    BuildContext context,
    SaveOrderErrorType? saveOrderErrorStatus,
  ) {
    final l10n = S.of(context);

    if (saveOrderErrorStatus == null) return '';

    switch (saveOrderErrorStatus) {
      case SaveOrderErrorType.userNotFound:
        return l10n.userNotFound;
      case SaveOrderErrorType.locationNotFound:
        return l10n.locationNotFound;
      case SaveOrderErrorType.routeNotFound:
        return l10n.routeNotFound;
    }
  }
}
