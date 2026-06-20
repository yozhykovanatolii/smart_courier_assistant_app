import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/ui/theme/app_colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.errorMessage,
    this.counterText,
    this.keyboardType,
    this.controller,
    this.padding,
    this.maxLines = 1,
    this.minLines = 1,
    this.obscureText = false,
  });

  final TextEditingController? controller;
  final EdgeInsets? padding;
  final int maxLines;
  final int minLines;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final String? errorMessage;
  final String? counterText;
  final TextInputType? keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bodyLargeStyle = Theme.of(context).textTheme.bodyLarge;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: padding,
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerLow,
            border: Border.all(
              color: errorMessage == null
                  ? colorScheme.outline
                  : colorScheme.error,
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 1),
                blurRadius: 2,
                color: colorScheme.shadow.withValues(alpha: 0.24),
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            cursorColor: AppColors.blue,
            keyboardType: keyboardType,
            onChanged: onChanged,
            obscuringCharacter: '*',
            maxLines: maxLines,
            minLines: minLines,
            decoration: InputDecoration(hintText: hintText),
          ),
        ),
        if (counterText != null)
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              counterText!,
              style: bodyLargeStyle?.copyWith(
                color: errorMessage != null ? colorScheme.error : null,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        if (errorMessage != null)
          Text(
            errorMessage!,
            style: bodyLargeStyle?.copyWith(
              color: colorScheme.error,
            ),
          ),
      ],
    );
  }
}
