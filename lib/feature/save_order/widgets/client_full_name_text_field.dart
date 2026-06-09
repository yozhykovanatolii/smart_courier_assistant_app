import 'package:flutter/widgets.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_text_field.dart';

class ClientFullNameTextField extends StatelessWidget {
  const ClientFullNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      hintText: 'John Dou',
      onChanged: (clientFullName) {},
      isValid: true,
    );
  }
}
