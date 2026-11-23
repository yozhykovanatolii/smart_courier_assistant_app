import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

@RoutePage()
class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _VerificationView();
  }
}

class _VerificationView extends StatelessWidget {
  const _VerificationView();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
