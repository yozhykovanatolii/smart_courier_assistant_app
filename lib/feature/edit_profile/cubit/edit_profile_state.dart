import 'package:formz/formz.dart';
import 'package:smart_courier_assistant_app/validation/full_name_validator.dart';
import 'package:smart_courier_assistant_app/validation/phone_number_validator.dart';

enum EditProfileErrorType {
  userNotFound,
  storagePermissionDeny,
  userPhotoNotSelected,
}

class EditProfileState {
  final FullNameValidator fullNameValidator;
  final PhoneNumberValidator phoneNumberValidator;
  final String userAvatar;
  final FormzSubmissionStatus formStatus;
  final EditProfileErrorType? editProfileErrorType;

  EditProfileState({
    required this.fullNameValidator,
    required this.phoneNumberValidator,
    required this.userAvatar,
    required this.formStatus,
    this.editProfileErrorType,
  });

  factory EditProfileState.initial() {
    return EditProfileState(
      fullNameValidator: const FullNameValidator.pure(),
      phoneNumberValidator: const PhoneNumberValidator.pure(),
      userAvatar: '',
      formStatus: FormzSubmissionStatus.initial,
    );
  }

  bool get isValid => Formz.validate(
    [fullNameValidator, phoneNumberValidator],
  );

  EditProfileState copyWith({
    FullNameValidator? fullNameValidator,
    PhoneNumberValidator? phoneNumberValidator,
    String? userAvatar,
    FormzSubmissionStatus? formStatus,
    EditProfileErrorType? editProfileErrorType,
    bool clearEditProfileErrorType = false,
  }) {
    return EditProfileState(
      fullNameValidator: fullNameValidator ?? this.fullNameValidator,
      phoneNumberValidator: phoneNumberValidator ?? this.phoneNumberValidator,
      userAvatar: userAvatar ?? this.userAvatar,
      formStatus: formStatus ?? this.formStatus,
      editProfileErrorType: clearEditProfileErrorType
          ? null
          : editProfileErrorType ?? this.editProfileErrorType,
    );
  }
}
