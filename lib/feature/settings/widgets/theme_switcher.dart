import 'package:flutter/material.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: true,
      activeTrackColor: Colors.green,
      activeThumbColor: Colors.white,
      onChanged: (isDarkMode) {},
    );
  }
}
