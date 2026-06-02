import 'package:flutter/widgets.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_text_field.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      hintText: 'example@gmail.com',
      onChanged: (value) {},
      isValid: true,
    );
  }
}
