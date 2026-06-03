import 'package:bloc/bloc.dart';
import 'package:smart_courier_assistant_app/feature/register/cubit/register_state.dart';
import 'package:smart_courier_assistant_app/validation/email_validator.dart';
import 'package:smart_courier_assistant_app/validation/full_name_validator.dart';
import 'package:smart_courier_assistant_app/validation/password_validator.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState.initial());

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
}
