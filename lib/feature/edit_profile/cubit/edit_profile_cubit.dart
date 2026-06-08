import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:smart_courier_assistant_app/core/exceptions/user_not_found_exception.dart';
import 'package:smart_courier_assistant_app/data/models/user_model.dart';
import 'package:smart_courier_assistant_app/data/repository/user_repository.dart';
import 'package:smart_courier_assistant_app/feature/edit_profile/cubit/edit_profile_state.dart';
import 'package:smart_courier_assistant_app/validation/full_name_validator.dart';
import 'package:smart_courier_assistant_app/validation/phone_number_validator.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final UserRepository _userRepository;

  EditProfileCubit(this._userRepository) : super(EditProfileState.initial());

  Future<void> editUserAvatar() async {}

  void setProfileFullName(String fullName) {
    emit(
      state.copyWith(
        fullNameValidator: FullNameValidator.dirty(
          fullName: fullName,
        ),
      ),
    );
  }

  void setProfilePhoneNumber(String phoneNumber) {
    emit(
      state.copyWith(
        phoneNumberValidator: PhoneNumberValidator.dirty(
          phoneNumber: phoneNumber,
        ),
      ),
    );
  }

  void fetchUserProfile(UserModel user) {
    emit(
      state.copyWith(
        fullNameValidator: FullNameValidator.dirty(fullName: user.fullName),
        phoneNumberValidator: PhoneNumberValidator.dirty(
          phoneNumber: user.phoneNumber,
        ),
        userAvatar: user.avatar,
      ),
    );
  }

  Future<void> updateProfile() async {
    emit(state.copyWith(formStatus: FormzSubmissionStatus.inProgress));
    try {
      await _userRepository.updateUser(
        state.userAvatar,
        state.fullNameValidator.value,
        state.phoneNumberValidator.value,
      );
      emit(
        state.copyWith(
          formStatus: FormzSubmissionStatus.success,
          clearEditProfileErrorType: true,
        ),
      );
    } on UserNotFoundException catch (_) {
      emit(
        state.copyWith(
          formStatus: FormzSubmissionStatus.failure,
          editProfileErrorType: EditProfileErrorType.userNotFound,
        ),
      );
    }
  }
}
