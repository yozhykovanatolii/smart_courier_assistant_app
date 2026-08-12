import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:smart_courier_assistant_app/exceptions/login_exception.dart';
import 'package:smart_courier_assistant_app/domain/repository/auth_repository.dart';
import 'package:smart_courier_assistant_app/feature/login/cubit/login_state.dart';
import 'package:smart_courier_assistant_app/validation/email_validator.dart';
import 'package:smart_courier_assistant_app/validation/password_validator.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit(this._authRepository) : super(LoginState.initial());

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

  Future<void> signInWithEmailAndPassword() async {
    emit(state.copyWith(loginStatus: FormzSubmissionStatus.inProgress));
    try {
      await _authRepository.signInUser(
        state.emailValidator.value,
        state.passwordValidator.value,
      );
      emit(state.copyWith(loginStatus: FormzSubmissionStatus.success));
    } on LoginException catch (exception) {
      emit(
        state.copyWith(
          loginErrorStatus: exception.errorStatus,
          loginStatus: FormzSubmissionStatus.failure,
        ),
      );
    }
  }
}
