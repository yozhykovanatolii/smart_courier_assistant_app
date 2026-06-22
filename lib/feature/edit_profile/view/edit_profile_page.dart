import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_courier_assistant_app/bloc/app/app_bloc.dart';
import 'package:smart_courier_assistant_app/bloc/app/app_event.dart';
import 'package:smart_courier_assistant_app/bloc/app/app_state.dart';
import 'package:smart_courier_assistant_app/feature/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:smart_courier_assistant_app/feature/edit_profile/cubit/edit_profile_state.dart';
import 'package:smart_courier_assistant_app/feature/edit_profile/widgets/widgets.dart';
import 'package:smart_courier_assistant_app/localization/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/ui_helper.dart';
import 'package:smart_courier_assistant_app/ui/widgets/arrow_back_button.dart';

@RoutePage()
class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<EditProfileCubit>(),
      child: const _EditProfileView(),
    );
  }
}

class _EditProfileView extends StatefulWidget {
  const _EditProfileView();

  @override
  State<_EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<_EditProfileView> {
  final _fullNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final appState = context.read<AppBloc>().state;
      if (appState is AppAuthenticatedState) {
        context.read<EditProfileCubit>().fetchUserProfile(appState.user);
        _fullNameController.text = appState.user.fullName;
        _phoneNumberController.text = appState.user.phoneNumber;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final labelLargeStyle = Theme.of(context).textTheme.labelLarge;

    return Scaffold(
      body: BlocListener<EditProfileCubit, EditProfileState>(
        listenWhen: (previous, current) {
          return previous.formStatus != current.formStatus;
        },
        listener: (context, state) {
          final formStatus = state.formStatus;
          if (formStatus == FormzSubmissionStatus.failure) {
            final errorMessage = _mapEditProfileErrorTypeToMessage(
              context,
              state.editProfileErrorType,
            );
            UiHelper.showSnackBar(
              context: context,
              message: errorMessage,
              isErrorSnackBar: true,
            );
          }
          if (formStatus == FormzSubmissionStatus.success) {
            UiHelper.showSnackBar(
              context: context,
              message: S.of(context).successUpdatingProfile,
            );
            context.read<AppBloc>().add(AppUserSubscriptionRequested());
          }
        },
        child: SafeArea(
          minimum: const EdgeInsets.only(left: 11, right: 24),
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    l10n.fullName,
                    style: labelLargeStyle,
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 5),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: EditProfileFullNameTextField(
                    controller: _fullNameController,
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 25),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    l10n.phoneNumber,
                    style: labelLargeStyle,
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 5),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: EditProfilePhoneNumberTextField(
                    controller: _phoneNumberController,
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 40),
              ),
              const SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20, left: 10),
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
      ),
    );
  }

  String _mapEditProfileErrorTypeToMessage(
    BuildContext context,
    EditProfileErrorType? editProfileErrorType,
  ) {
    final l10n = S.of(context);

    if (editProfileErrorType == null) return '';

    switch (editProfileErrorType) {
      case EditProfileErrorType.storagePermissionDeny:
        return l10n.storagePermissionDeny;
      case EditProfileErrorType.userNotFound:
        return l10n.userNotFound;
      case EditProfileErrorType.userPhotoNotSelected:
        return l10n.photoWasNotSelected;
    }
  }
}
