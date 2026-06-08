import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/feature/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:smart_courier_assistant_app/ui/theme/app_colors.dart';

class EditProfileAvatarSection extends StatelessWidget {
  const EditProfileAvatarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Stack(
        children: [
          _EditProfileAvatar(),
          Positioned(
            bottom: 0.5,
            right: -3,
            child: _EditAvatarButton(),
          ),
        ],
      ),
    );
  }
}

class _EditProfileAvatar extends StatelessWidget {
  const _EditProfileAvatar();

  @override
  Widget build(BuildContext context) {
    final userAvatarUrl = context.select(
      (EditProfileCubit bloc) => bloc.state.userAvatar,
    );

    return SizedBox(
      height: 100,
      width: 100,
      child: CircleAvatar(
        backgroundImage: NetworkImage(
          userAvatarUrl.isNotEmpty
              ? userAvatarUrl
              : 'https://fojohxjzxvieoakjyzwz.supabase.co/storage/v1/object/public/images/users/default_avatar.jpg',
        ),
      ),
    );
  }
}

class _EditAvatarButton extends StatelessWidget {
  const _EditAvatarButton();

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: () {
        context.read<EditProfileCubit>().editUserAvatar();
      },
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.blue600),
      ),
      icon: const Icon(Icons.camera_alt),
    );
  }
}
