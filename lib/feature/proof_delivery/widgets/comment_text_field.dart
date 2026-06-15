import 'package:flutter/widgets.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_text_field.dart';

class CommentTextField extends StatelessWidget {
  const CommentTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      padding: const EdgeInsets.symmetric(vertical: 16),
      maxLines: 3,
      minLines: 3,
      hintText: S.of(context).enterComment,
      onChanged: (comment) {},
      isValid: true,
    );
  }
}
