import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:smart_courier_assistant_app/domain/repository/auth_repository.dart';
import 'package:smart_courier_assistant_app/exceptions/resending_code_exception.dart';
import 'package:smart_courier_assistant_app/exceptions/verification_code_exception.dart';
import 'package:smart_courier_assistant_app/feature/verification/cubit/verification_state.dart';
import 'package:smart_courier_assistant_app/validation/otp_code_validator.dart';

class VerificationCubit extends Cubit<VerificationState> {
  final AuthRepository _authRepository;

  VerificationCubit(this._authRepository, {required String email})
    : super(VerificationState.initial().copyWith(email: email));

  void setOptCode(String optCode) {
    if (optCode.isEmpty && state.otpCodeValidator.isPure) return;
    emit(
      state.copyWith(
        otpCodeValidator: OtpCodeValidator.dirty(
          otpCode: optCode,
        ),
      ),
    );
  }

  Future<void> verifyUserEmail() async {
    final email = state.email;
    if (email == null) return;
    emit(state.copyWith(verificationStatus: FormzSubmissionStatus.inProgress));
    try {
      await _authRepository.verifyEmail(
        email,
        state.otpCodeValidator.value,
      );
      emit(
        state.copyWith(
          verificationStatus: FormzSubmissionStatus.success,
          clearVerificationErrorStatus: true,
          clearEmail: true,
        ),
      );
    } on VerificationCodeException catch (exception) {
      emit(
        state.copyWith(
          verificationErrorStatus: exception.errorStatus,
          verificationStatus: FormzSubmissionStatus.failure,
        ),
      );
    }
  }

  Future<void> resendCode() async {
    final email = state.email;
    if (email == null) return;
    emit(state.copyWith(resendingCodeStatus: FormzSubmissionStatus.inProgress));
    try {
      await _authRepository.resendCode(email);
      emit(
        state.copyWith(
          resendingCodeStatus: FormzSubmissionStatus.success,
          clearResendingCodeErrorStatus: true,
        ),
      );
    } on ResendingCodeException catch (exception) {
      emit(
        state.copyWith(
          resendingCodeErrorStatus: exception.errorStatus,
          resendingCodeStatus: FormzSubmissionStatus.failure,
        ),
      );
    }
  }
}
