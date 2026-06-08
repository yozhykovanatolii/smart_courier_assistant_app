import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/feature/edit_profile/widgets/widgets.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/widgets/arrow_back_button.dart';

@RoutePage()
class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final labelLargeStyle = Theme.of(context).textTheme.labelLarge;

    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(left: 24, right: 24),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Row(
                spacing: 11,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ArrowBackButton(),
                  Text(
                    l10n.editProfile,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(width: 32),
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 40),
            ),
            const SliverToBoxAdapter(
              child: EditProfileAvatarSection(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 40),
            ),
            SliverToBoxAdapter(
              child: Text(
                l10n.fullName,
                style: labelLargeStyle,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 5),
            ),
            const SliverToBoxAdapter(
              child: EditProfileFullNameTextField(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 25),
            ),
            SliverToBoxAdapter(
              child: Text(
                l10n.phoneNumber,
                style: labelLargeStyle,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 5),
            ),
            const SliverToBoxAdapter(
              child: EditProfilePhoneNumberTextField(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 40),
            ),
            const SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    Spacer(),
                    EditProfileButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
