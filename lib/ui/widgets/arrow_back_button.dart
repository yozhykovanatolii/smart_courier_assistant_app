import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.maybePop(context),
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFECECEC),
        ),
        child: const Icon(
          Icons.arrow_back_sharp,
          size: 25,
        ),
      ),
    );
  }
}
