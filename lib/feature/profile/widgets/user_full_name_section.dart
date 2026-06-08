import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/bloc/app/app_bloc.dart';
import 'package:smart_courier_assistant_app/bloc/app/app_state.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';

class UserFullNameSection extends StatelessWidget {
  const UserFullNameSection({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppBloc>().state;
    final user = state is AppAuthenticatedState ? state.user : null;
    return Text(
      user?.fullName ?? S.of(context).unknown,
      style: Theme.of(context).textTheme.displaySmall?.copyWith(
        fontSize: 19,
      ),
    );
  }
}
