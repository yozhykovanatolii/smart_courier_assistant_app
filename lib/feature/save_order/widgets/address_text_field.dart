import 'package:flutter/widgets.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_text_field.dart';

class AddressTextField extends StatelessWidget {
  const AddressTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      hintText: 'London, Palace of Westminster',
      onChanged: (address) {},
      isValid: true,
    );
  }
}
