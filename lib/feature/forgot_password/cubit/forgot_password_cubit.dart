import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:smart_courier_assistant_app/core/exceptions/reset_password_exception.dart';
import 'package:smart_courier_assistant_app/data/repository/auth_repository.dart';
import 'package:smart_courier_assistant_app/feature/forgot_password/cubit/forgot_password_state.dart';
import 'package:smart_courier_assistant_app/validation/email_validator.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthRepository _authRepository;

  ForgotPasswordCubit(this._authRepository)
    : super(ForgotPasswordState.initial());

  void setUserEmail(String email) {
    emit(
      state.copyWith(
        emailValidator: EmailValidator.dirty(email: email),
      ),
    );
  }

  Future<void> resetPassword() async {
    emit(state.copyWith(formStatus: FormzSubmissionStatus.inProgress));
    try {
      await _authRepository.resetPassword(state.emailValidator.value);
      emit(
        state.copyWith(
          formStatus: FormzSubmissionStatus.success,
          clearResetPasswordErrorStatus: true,
        ),
      );
    } on ResetPasswordException catch (exception) {
      emit(
        state.copyWith(
          formStatus: FormzSubmissionStatus.failure,
          errorStatus: exception.resetPasswordErrorStatus,
        ),
      );
    }
  }
}
