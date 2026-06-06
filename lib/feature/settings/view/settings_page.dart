import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/feature/settings/widgets/widgets.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/widgets/arrow_back_button.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                spacing: 11,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ArrowBackButton(),
                  Text(
                    l10n.settings,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(width: 32),
                ],
              ),
            ),
            const SizedBox(height: 25),
            SettingsListTile(
              title: l10n.darkMode,
              leadingIcon: Icons.dark_mode,
              trailing: const ThemeSwitcher(),
            ),
            SettingsListTile(
              title: l10n.language,
              leadingIcon: Icons.language,
              trailing: const LanguageButton(),
            ),
          ],
        ),
      ),
    );
  }
}
