import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:smart_courier_assistant_app/feature/save_order/cubit/save_order_cubit.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_elevated_button.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_progress_indicator.dart';

class InformationDialogBox extends StatelessWidget {
  final String title;
  final String description;
  final Function()? onClickActionButton;

  const InformationDialogBox({
    super.key,
    required this.title,
    required this.description,
    required this.onClickActionButton,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      content: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.dangerous,
              size: 65,
              color: Colors.red,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: _DialogActionButton(
                    onPressed: () {
                      context.router.maybePop();
                    },
                    child: Text(
                      l10n.noKeepIt,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: _DialogActionButton(
                    color: Colors.red,
                    onPressed: onClickActionButton,
                    child: const _DeleteOrderContent(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DialogActionButton extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function()? onPressed;

  const _DialogActionButton({
    required this.onPressed,
    this.color = Colors.grey,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      onPressed: onPressed,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 9),
      backgroundColor: color,
      child: child,
    );
  }
}

class _DeleteOrderContent extends StatelessWidget {
  const _DeleteOrderContent();

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select<SaveOrderCubit, bool>(
      (saveOrderCubit) =>
          saveOrderCubit.state.deletingStatus ==
          FormzSubmissionStatus.inProgress,
    );
    return isLoading
        ? const AppProgressIndicator(scale: 0.6)
        : Text(
            S.of(context).yesDeleteIt,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          );
  }
}
