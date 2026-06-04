import 'package:formz/formz.dart';
import 'package:smart_courier_assistant_app/core/exceptions/register_exception.dart';
import 'package:smart_courier_assistant_app/validation/email_validator.dart';
import 'package:smart_courier_assistant_app/validation/full_name_validator.dart';
import 'package:smart_courier_assistant_app/validation/password_validator.dart';
import 'package:smart_courier_assistant_app/validation/phone_number_validator.dart';

class RegisterState {
  final EmailValidator emailValidator;
  final PasswordValidator passwordValidator;
  final FullNameValidator fullNameValidator;
  final PhoneNumberValidator phoneNumberValidator;
  final FormzSubmissionStatus formStatus;
  final RegisterErrorStatus? errorStatus;

  RegisterState({
    required this.emailValidator,
    required this.passwordValidator,
    required this.fullNameValidator,
    required this.phoneNumberValidator,
    required this.formStatus,
    this.errorStatus,
  });

  factory RegisterState.initial() {
    return RegisterState(
      emailValidator: const EmailValidator.pure(),
      passwordValidator: const PasswordValidator.pure(),
      fullNameValidator: const FullNameValidator.pure(),
      phoneNumberValidator: const PhoneNumberValidator.pure(),
      formStatus: FormzSubmissionStatus.initial,
    );
  }

  RegisterState copyWith({
    EmailValidator? emailValidator,
    PasswordValidator? passwordValidator,
    FullNameValidator? fullNameValidator,
    PhoneNumberValidator? phoneNumberValidator,
    FormzSubmissionStatus? formStatus,
    RegisterErrorStatus? errorStatus,
    bool clearRegisterErrorStatus = false,
  }) {
    return RegisterState(
      emailValidator: emailValidator ?? this.emailValidator,
      passwordValidator: passwordValidator ?? this.passwordValidator,
      fullNameValidator: fullNameValidator ?? this.fullNameValidator,
      phoneNumberValidator: phoneNumberValidator ?? this.phoneNumberValidator,
      formStatus: formStatus ?? this.formStatus,
      errorStatus: clearRegisterErrorStatus
          ? null
          : errorStatus ?? this.errorStatus,
    );
  }

  bool get isValid => Formz.validate([
    emailValidator,
    passwordValidator,
    fullNameValidator,
    phoneNumberValidator,
  ]);
}
