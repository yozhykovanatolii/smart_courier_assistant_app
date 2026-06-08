import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/bloc/app/app_bloc.dart';
import 'package:smart_courier_assistant_app/bloc/app/app_state.dart';
import 'package:smart_courier_assistant_app/ui/theme/app_colors.dart';

class UserProfileAvatar extends StatelessWidget {
  const UserProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppBloc>().state;
    final user = state is AppAuthenticatedState ? state.user : null;

    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: AppColors.grey500,
        ),
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            user?.avatar ??
                'https://fojohxjzxvieoakjyzwz.supabase.co/storage/v1/object/public/images/users/default_avatar.jpg',
          ),
        ),
      ),
    );
  }
}
