import 'package:flutter/widgets.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_text_field.dart';

class EditProfilePhoneNumberTextField extends StatelessWidget {
  const EditProfilePhoneNumberTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      hintText: '+380991234567',
      onChanged: (phoneNumber) {},
      isValid: true,
    );
  }
}
