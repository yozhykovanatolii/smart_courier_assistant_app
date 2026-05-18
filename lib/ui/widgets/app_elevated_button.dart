import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    required this.padding,
  });

  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: const Color(0xFF1D61E7),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            const BoxShadow(
              spreadRadius: 1,
              color: Color(0xFF375DFB),
            ),
            BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 2,
              color: const Color(0xFF253EA7).withValues(alpha: 0.48),
            ),
          ],
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
