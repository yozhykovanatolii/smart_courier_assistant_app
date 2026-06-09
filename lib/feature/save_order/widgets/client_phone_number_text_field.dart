import 'package:flutter/widgets.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_text_field.dart';

class ClientPhoneNumberTextField extends StatelessWidget {
  const ClientPhoneNumberTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      hintText: '+380991234567',
      onChanged: (clientPhoneNumber) {},
      isValid: true,
    );
  }
}
