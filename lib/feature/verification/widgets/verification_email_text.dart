import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/localization/generated/l10n.dart';

class VerificationEmailText extends StatelessWidget {
  const VerificationEmailText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).sentCodeToEmail('gamet6550@gmail.com'),
      textAlign: TextAlign.start,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
