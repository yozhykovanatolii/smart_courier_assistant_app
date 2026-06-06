import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/bloc/settings/settings_cubit.dart';
import 'package:smart_courier_assistant_app/feature/settings/widgets/language_modal_sheet.dart';
import 'package:smart_courier_assistant_app/ui/ui_helper.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isEnglish = context.select(
      (SettingsCubit cubit) => cubit.state.languageCode == 'en',
    );
    return GestureDetector(
      onTap: () {
        UiHelper.showModalSheet(
          context,
          const LanguageModalSheet(),
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            isEnglish ? 'English' : 'Українська',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_right,
            size: 28,
          ),
        ],
      ),
    );
  }
}
