import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_courier_assistant_app/domain/entity/order_entity.dart';
import 'package:smart_courier_assistant_app/feature/save_order/cubit/save_order_cubit.dart';
import 'package:smart_courier_assistant_app/feature/save_order/cubit/save_order_state.dart';
import 'package:smart_courier_assistant_app/feature/save_order/widgets/widgets.dart';
import 'package:smart_courier_assistant_app/localization/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/theme/app_colors.dart';
import 'package:smart_courier_assistant_app/ui/ui_helper.dart';

class SaveOrderPage extends StatelessWidget {
  final OrderEntity? order;

  const SaveOrderPage({
    super.key,
    this.order,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<SaveOrderCubit>(),
      child: _SaveOrderView(order),
    );
  }
}

class _SaveOrderView extends StatefulWidget {
  final OrderEntity? order;

  const _SaveOrderView(this.order);

  @override
  State<_SaveOrderView> createState() => _SaveOrderViewState();
}

class _SaveOrderViewState extends State<_SaveOrderView> {
  late final SaveOrderCubit _cubit;
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _clientFullNameController =
      TextEditingController();
  final TextEditingController _clientPhoneNumberController =
      TextEditingController();

  @override
  void initState() {
    _cubit = context.read<SaveOrderCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cubit.editOrder(widget.order);
      _addressController.text = widget.order?.address.name ?? '';
      _clientFullNameController.text = widget.order?.clientFullName ?? '';
      _clientPhoneNumberController.text = widget.order?.clientPhoneNumber ?? '';
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final labelLargeStyle = Theme.of(context).textTheme.labelLarge;

    return BlocListener<SaveOrderCubit, SaveOrderState>(
      listenWhen: (previous, current) {
        return previous.formStatus != current.formStatus ||
            previous.deletingStatus != current.deletingStatus;
      },
      listener: (context, state) {
        final l10n = S.of(context);
        final formStatus = state.formStatus;
        final deletingStatus = state.deletingStatus;
        if (formStatus == FormzSubmissionStatus.failure ||
            deletingStatus == FormzSubmissionStatus.failure) {
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
        if (formStatus == FormzSubmissionStatus.success ||
            deletingStatus == FormzSubmissionStatus.success) {
          final isDeletingStatusSuccess =
              deletingStatus == FormzSubmissionStatus.success;
          context.router.pop();
          if (isDeletingStatusSuccess) {
            context.router.pop();
          }
          UiHelper.showSnackBar(
            context: context,
            message: isDeletingStatusSuccess
                ? l10n.successDeletingOrder
                : l10n.successSavingOrder,
          );
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
              HeaderSection(
                iconDeleteOrderButton: widget.order != null
                    ? IconDeleteOrderButton(
                        orderId: widget.order!.id,
                      )
                    : null,
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
                    AddressTextField(
                      addressController: _addressController,
                    ),
                    const SizedBox(height: 10),
                    const BottleQuantinySection(),
                    const SizedBox(height: 15),
                    Text(
                      l10n.client,
                      style: labelLargeStyle,
                    ),
                    const SizedBox(height: 5),
                    ClientFullNameTextField(
                      clientFullNameController: _clientFullNameController,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      l10n.contactPhone,
                      style: labelLargeStyle,
                    ),
                    const SizedBox(height: 5),
                    ClientPhoneNumberTextField(
                      clientPhoneNumberController: _clientPhoneNumberController,
                    ),
                    const SizedBox(height: 10),
                    const OrderDeliveryTimeSection(),
                  ],
                ),
              ),
              const SizedBox(height: 45),
              SaveOrderButton(
                order: widget.order,
              ),
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
      case SaveOrderErrorType.invalidCredentials:
        return l10n.invalidCredential;
      case SaveOrderErrorType.invalidValidation:
        return l10n.registerValidationFailed;
      case SaveOrderErrorType.accessDenied:
        return l10n.accessDenied;
      case SaveOrderErrorType.locationNotFound:
        return l10n.locationNotFound;
      case SaveOrderErrorType.dataNotFound:
        return l10n.dataNotFound;
    }
  }
}
