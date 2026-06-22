import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:smart_courier_assistant_app/exceptions/register_exception.dart';
import 'package:smart_courier_assistant_app/domain/repository/auth_repository.dart';
import 'package:smart_courier_assistant_app/feature/register/cubit/register_state.dart';
import 'package:smart_courier_assistant_app/validation/email_validator.dart';
import 'package:smart_courier_assistant_app/validation/full_name_validator.dart';
import 'package:smart_courier_assistant_app/validation/password_validator.dart';
import 'package:smart_courier_assistant_app/validation/phone_number_validator.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository _authRepository;

  RegisterCubit(this._authRepository) : super(RegisterState.initial());

  void setRegisterEmail(String email) {
    emit(
      state.copyWith(
        emailValidator: EmailValidator.dirty(email: email),
      ),
    );
  }

  void setRegisterPassword(String password) {
    emit(
      state.copyWith(
        passwordValidator: PasswordValidator.dirty(password: password),
      ),
    );
  }

  void setRegisterFullName(String fullName) {
    emit(
      state.copyWith(
        fullNameValidator: FullNameValidator.dirty(fullName: fullName),
      ),
    );
  }

  void setRegisterPhoneNumber(String phoneNumber) {
    emit(
      state.copyWith(
        phoneNumberValidator: PhoneNumberValidator.dirty(
          phoneNumber: phoneNumber,
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    emit(state.copyWith(formStatus: FormzSubmissionStatus.inProgress));
    try {
      await _authRepository.signUpUser(
        state.emailValidator.value,
        state.passwordValidator.value,
        state.fullNameValidator.value,
        state.phoneNumberValidator.value,
      );
      emit(
        state.copyWith(
          formStatus: FormzSubmissionStatus.success,
          clearRegisterErrorStatus: true,
        ),
      );
    } on RegisterException catch (exception) {
      emit(
        state.copyWith(
          formStatus: FormzSubmissionStatus.failure,
          errorStatus: exception.registerErrorStatus,
        ),
      );
    }
  }
}
