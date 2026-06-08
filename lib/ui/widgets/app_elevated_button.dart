import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    required this.padding,
    required this.backgroundColor,
    this.boxShadows,
    this.border,
  });

  final Color backgroundColor;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry padding;
  final List<BoxShadow>? boxShadows;
  final Border? border;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: border,
          borderRadius: BorderRadius.circular(10),
          boxShadow: boxShadows,
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
