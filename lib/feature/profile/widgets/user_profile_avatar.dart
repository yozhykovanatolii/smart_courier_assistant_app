import 'package:flutter/widgets.dart';
import 'package:smart_courier_assistant_app/ui/theme/app_colors.dart';

class UserProfileAvatar extends StatelessWidget {
  const UserProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: AppColors.grey500,
        ),
        shape: BoxShape.circle,
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            'https://fojohxjzxvieoakjyzwz.supabase.co/storage/v1/object/public/images/users/default_avatar.jpg',
          ),
        ),
      ),
    );
  }
}
