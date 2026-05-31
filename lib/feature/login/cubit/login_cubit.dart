import 'package:bloc/bloc.dart';
import 'package:smart_courier_assistant_app/feature/login/cubit/login_state.dart';
import 'package:smart_courier_assistant_app/validation/email_validator.dart';
import 'package:smart_courier_assistant_app/validation/password_validator.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());

  void setLoginEmail(String email) {
    emit(
      state.copyWith(
        emailValidator: EmailValidator.dirty(email: email),
      ),
    );
  }

  void setLoginPassword(String password) {
    emit(
      state.copyWith(
        passwordValidator: PasswordValidator.dirty(password: password),
      ),
    );
  }
}
