import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/feature/profile/widgets/widgets.dart';
import 'package:smart_courier_assistant_app/ui/widgets/arrow_back_button.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            Row(
              spacing: 11,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ArrowBackButton(),
                Text(
                  'Profile',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(width: 32),
              ],
            ),
            const SizedBox(height: 40),
            const UserProfileAvatar(),
            const SizedBox(height: 10),
            const UserFullNameSection(),
            const SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  SectionListTile(
                    leadingIcon: Icons.person,
                    title: 'Edit profile',
                    onTap: () {},
                  ),
                  SectionListTile(
                    leadingIcon: Icons.route,
                    title: 'My routes',
                    onTap: () {},
                  ),
                  SectionListTile(
                    leadingIcon: Icons.settings,
                    title: 'Settings',
                    onTap: () {},
                  ),
                  SectionListTile(
                    leadingIcon: Icons.logout,
                    title: 'Logout',
                    isLogOut: true,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
