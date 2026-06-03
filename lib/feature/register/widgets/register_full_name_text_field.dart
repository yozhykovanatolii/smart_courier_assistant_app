import 'package:flutter/widgets.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_text_field.dart';

class RegisterFullNameTextField extends StatelessWidget {
  const RegisterFullNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      hintText: 'John Dou',
      onChanged: (fullName) {},
      isValid: true,
    );
  }
}
