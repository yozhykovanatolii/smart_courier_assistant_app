import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/bloc/app/app_bloc.dart';
import 'package:smart_courier_assistant_app/bloc/app/app_event.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';
import 'package:smart_courier_assistant_app/router/app_router.gr.dart';
import 'package:smart_courier_assistant_app/ui/theme/app_colors.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_elevated_button.dart';

class LogoutModalSheet extends StatelessWidget {
  const LogoutModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 5),
            Text(
              l10n.logout,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            Text(
              l10n.areYouSureYouWantToLogOut,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 19,
              ),
            ),
            const SizedBox(height: 60),
            const _LogoutActionButtonsSection(),
          ],
        ),
      ),
    );
  }
}

class _LogoutActionButtonsSection extends StatelessWidget {
  const _LogoutActionButtonsSection();

  @override
  Widget build(BuildContext context) {
    final router = context.router;
    final l10n = S.of(context);

    return Row(
      spacing: 20,
      children: [
        Expanded(
          child: _LogoutActionButton(
            text: l10n.cancel,
            onPressed: () => router.maybePop(),
            isLogOutButton: false,
          ),
        ),
        Expanded(
          child: _LogoutActionButton(
            text: l10n.yesLogout,
            onPressed: () {
              context.read<AppBloc>().add(AppLogoutPressed());
              router.replace(const LoginRoute());
            },
          ),
        ),
      ],
    );
  }
}

class _LogoutActionButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final bool isLogOutButton;

  const _LogoutActionButton({
    required this.text,
    required this.onPressed,
    this.isLogOutButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      onPressed: onPressed,
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 13),
      backgroundColor: isLogOutButton ? Colors.red : AppColors.grey500,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontSize: 17,
          color: isLogOutButton ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
