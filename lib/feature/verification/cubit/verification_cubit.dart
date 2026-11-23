import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/feature/verification/cubit/verification_state.dart';
import 'package:smart_courier_assistant_app/validation/otp_code_validator.dart';

class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit({required String email})
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
}
