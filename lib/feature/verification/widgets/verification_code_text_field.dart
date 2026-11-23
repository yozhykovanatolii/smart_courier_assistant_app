import 'package:flutter/widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:smart_courier_assistant_app/ui/theme/app_colors.dart';

class VerificationCodeTextField extends StatelessWidget {
  const VerificationCodeTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        MaterialPinField(
          length: 6,
          onChanged: (optCode) {},
          theme: const MaterialPinTheme(
            cellSize: Size(44, 56),
            shape: MaterialPinShape.underlined,
            cursorColor: AppColors.blue700,
            focusedBorderColor: AppColors.blue700,
          ),
        ),
      ],
    );
  }
}
