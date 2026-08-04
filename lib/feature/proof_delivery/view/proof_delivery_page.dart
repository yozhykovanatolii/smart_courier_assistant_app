import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_courier_assistant_app/feature/proof_delivery/cubit/proof_delivery_cubit.dart';
import 'package:smart_courier_assistant_app/feature/proof_delivery/cubit/proof_delivery_state.dart';
import 'package:smart_courier_assistant_app/feature/proof_delivery/widgets/widgets.dart';
import 'package:smart_courier_assistant_app/localization/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/theme/app_colors.dart';
import 'package:smart_courier_assistant_app/ui/ui_helper.dart';

class ProofDeliveryPage extends StatelessWidget {
  final String orderId;

  const ProofDeliveryPage({
    super.key,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<ProofDeliveryCubit>(),
      child: _ProofDeliveryView(orderId),
    );
  }
}

class _ProofDeliveryView extends StatelessWidget {
  final String orderId;

  const _ProofDeliveryView(this.orderId);

  @override
  Widget build(BuildContext context) {
    final labelLargeStyle = Theme.of(context).textTheme.labelLarge;
    final l10n = S.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      margin: const EdgeInsets.only(top: 190),
      decoration: BoxDecoration(
        color: Theme.of(
          context,
        ).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: Scaffold(
        body: BlocListener<ProofDeliveryCubit, ProofDeliveryState>(
          listenWhen: (previous, current) {
            return previous.formStatus != current.formStatus;
          },
          listener: (context, state) {
            final formStatus = state.formStatus;
            if (formStatus == FormzSubmissionStatus.failure) {
              final errorMessage = _mapProofDeliveryErrorStatusToString(
                context,
                state.deliveryErrorType,
              );
              UiHelper.showSnackBar(
                context: context,
                message: errorMessage,
                isErrorSnackBar: true,
              );
            }
            if (formStatus == FormzSubmissionStatus.success) {
              UiHelper.showSnackBar(
                context: context,
                message: S.of(context).successConfirmingADelivery,
              );
              context.router.maybePop();
            }
          },
          child: SafeArea(
            child: Column(
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
                const HeaderProofDelivery(),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    children: [
                      Text(
                        l10n.comment,
                        style: labelLargeStyle,
                      ),
                      const SizedBox(height: 5),
                      const CommentTextField(),
                      const SizedBox(height: 20),
                      Text(
                        l10n.photo,
                        style: labelLargeStyle,
                      ),
                      const SizedBox(height: 15),
                      const PhotoListView(),
                      const SizedBox(height: 80),
                      ConfirmButton(
                        orderId: orderId,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _mapProofDeliveryErrorStatusToString(
    BuildContext context,
    ProofDeliveryErrorType? proofDeliveryErrorStatus,
  ) {
    final l10n = S.of(context);

    if (proofDeliveryErrorStatus == null) return '';

    switch (proofDeliveryErrorStatus) {
      case ProofDeliveryErrorType.invalidCredentials:
        return l10n.invalidCredential;
      case ProofDeliveryErrorType.storagePermissionDeny:
        return l10n.storagePermissionDeny;
      case ProofDeliveryErrorType.photoNotSelected:
        return l10n.photoWasNotSelected;
      case ProofDeliveryErrorType.invalidValidation:
        return l10n.registerValidationFailed;
      case ProofDeliveryErrorType.accessDenied:
        return l10n.accessDenied;
      case ProofDeliveryErrorType.dataNotFound:
        return l10n.dataNotFound;
    }
  }
}
