import 'package:formz/formz.dart';
import 'package:smart_courier_assistant_app/validation/address_validator.dart';
import 'package:smart_courier_assistant_app/validation/full_name_validator.dart';
import 'package:smart_courier_assistant_app/validation/phone_number_validator.dart';

enum SaveOrderErrorType {
  invalidCredentials,
  invalidValidation,
  locationNotFound,
  dataNotFound,
  accessDenied,
}

class SaveOrderState {
  final FullNameValidator clientFullNameValidator;
  final PhoneNumberValidator clientPhoneNumberValidator;
  final AddressValidator addressValidator;
  final DateTime deliveryBy;
  final FormzSubmissionStatus formStatus;
  final FormzSubmissionStatus deletingStatus;
  final SaveOrderErrorType? saveOrderErrorType;
  final int bottleQuantity;

  SaveOrderState({
    required this.clientFullNameValidator,
    required this.clientPhoneNumberValidator,
    required this.addressValidator,
    required this.deliveryBy,
    required this.formStatus,
    required this.deletingStatus,
    required this.bottleQuantity,
    this.saveOrderErrorType,
  });

  factory SaveOrderState.initial() {
    return SaveOrderState(
      clientFullNameValidator: const FullNameValidator.pure(),
      clientPhoneNumberValidator: const PhoneNumberValidator.pure(),
      addressValidator: const AddressValidator.pure(),
      deliveryBy: DateTime.now(),
      formStatus: FormzSubmissionStatus.initial,
      deletingStatus: FormzSubmissionStatus.initial,
      bottleQuantity: 2,
    );
  }

  bool get isValid => Formz.validate([
    clientFullNameValidator,
    clientPhoneNumberValidator,
    addressValidator,
  ]);

  SaveOrderState copyWith({
    FullNameValidator? clientFullNameValidator,
    PhoneNumberValidator? clientPhoneNumberValidator,
    AddressValidator? addressValidator,
    DateTime? deliveryBy,
    FormzSubmissionStatus? formStatus,
    FormzSubmissionStatus? deletingStatus,
    SaveOrderErrorType? saveOrderErrorType,
    int? bottleQuantity,
  }) {
    return SaveOrderState(
      clientFullNameValidator:
          clientFullNameValidator ?? this.clientFullNameValidator,
      clientPhoneNumberValidator:
          clientPhoneNumberValidator ?? this.clientPhoneNumberValidator,
      addressValidator: addressValidator ?? this.addressValidator,
      deliveryBy: deliveryBy ?? this.deliveryBy,
      formStatus: formStatus ?? this.formStatus,
      deletingStatus: deletingStatus ?? this.deletingStatus,
      saveOrderErrorType: saveOrderErrorType ?? this.saveOrderErrorType,
      bottleQuantity: bottleQuantity ?? this.bottleQuantity,
    );
  }
}
