import 'package:flutter/material.dart';

class UserFullNameSection extends StatelessWidget {
  const UserFullNameSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Yozhykov Maksim',
      style: Theme.of(context).textTheme.displaySmall?.copyWith(
        fontSize: 19,
      ),
    );
  }
}
