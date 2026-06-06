import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/bloc/settings/settings_cubit.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/theme/app_colors.dart';
import 'package:smart_courier_assistant_app/ui/widgets/arrow_back_button.dart';

class LanguageModalSheet extends StatelessWidget {
  const LanguageModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ArrowBackButton(),
                Text(
                  l10n.languages,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(width: 32),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              l10n.selectLanguage,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            const Column(
              spacing: 20,
              children: [
                _LanguageListTile(
                  countryCode: '🇺🇦',
                  countryLanguage: 'Українська',
                  languageCode: 'uk',
                ),
                _LanguageListTile(
                  countryCode: '🇬🇧',
                  countryLanguage: 'English',
                  languageCode: 'en',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _LanguageListTile extends StatelessWidget {
  final String countryLanguage;
  final String countryCode;
  final String languageCode;

  const _LanguageListTile({
    required this.countryCode,
    required this.countryLanguage,
    required this.languageCode,
  });

  @override
  Widget build(BuildContext context) {
    final isLanguageSelected = context.select(
      (SettingsCubit cubit) => cubit.state.languageCode == languageCode,
    );
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: isLanguageSelected ? 2 : 0.8,
          color: isLanguageSelected ? Colors.blue : Colors.black,
        ),
      ),
      child: ListTile(
        onTap: () {
          context.read<SettingsCubit>().changeLanguageCode(languageCode);
        },
        leading: Text(
          countryCode,
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
        title: Text(
          countryLanguage,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 18,
          ),
        ),
        trailing: isLanguageSelected
            ? const Icon(
                color: AppColors.teal,
                Icons.check_circle,
                size: 25,
              )
            : null,
      ),
    );
  }
}
