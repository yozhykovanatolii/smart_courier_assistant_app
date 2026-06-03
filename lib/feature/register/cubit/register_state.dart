import 'package:smart_courier_assistant_app/validation/email_validator.dart';
import 'package:smart_courier_assistant_app/validation/full_name_validator.dart';
import 'package:smart_courier_assistant_app/validation/password_validator.dart';
import 'package:smart_courier_assistant_app/validation/phone_number_validator.dart';

class RegisterState {
  final EmailValidator emailValidator;
  final PasswordValidator passwordValidator;
  final FullNameValidator fullNameValidator;
  final PhoneNumberValidator phoneNumberValidator;

  RegisterState({
    required this.emailValidator,
    required this.passwordValidator,
    required this.fullNameValidator,
    required this.phoneNumberValidator,
  });

  factory RegisterState.initial() {
    return RegisterState(
      emailValidator: const EmailValidator.pure(),
      passwordValidator: const PasswordValidator.pure(),
      fullNameValidator: const FullNameValidator.pure(),
      phoneNumberValidator: const PhoneNumberValidator.pure(),
    );
  }

  RegisterState copyWith({
    EmailValidator? emailValidator,
    PasswordValidator? passwordValidator,
    FullNameValidator? fullNameValidator,
    PhoneNumberValidator? phoneNumberValidator,
  }) {
    return RegisterState(
      emailValidator: emailValidator ?? this.emailValidator,
      passwordValidator: passwordValidator ?? this.passwordValidator,
      fullNameValidator: fullNameValidator ?? this.fullNameValidator,
      phoneNumberValidator: phoneNumberValidator ?? this.phoneNumberValidator,
    );
  }
}
