import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/ui/theme/app_colors.dart';

class SettingsListTile extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  final Widget trailing;

  const SettingsListTile({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
      leading: Icon(
        size: 36,
        leadingIcon,
        color: AppColors.blue600,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontSize: 18,
        ),
      ),
      trailing: trailing,
    );
  }
}
