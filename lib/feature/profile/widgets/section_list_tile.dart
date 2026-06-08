import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/ui/theme/app_colors.dart';

class SectionListTile extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final Function()? onTap;
  final bool isLogOut;

  const SectionListTile({
    super.key,
    required this.leadingIcon,
    required this.title,
    this.isLogOut = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        leadingIcon,
        size: 30,
        color: isLogOut ? Colors.red : AppColors.blue600,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: isLogOut ? Colors.red : null,
          fontSize: 18,
        ),
      ),
      trailing: const Icon(
        Icons.keyboard_arrow_right,
        size: 28,
      ),
    );
  }
}
