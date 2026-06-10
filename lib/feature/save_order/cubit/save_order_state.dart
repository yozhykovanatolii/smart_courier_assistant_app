import 'package:formz/formz.dart';
import 'package:smart_courier_assistant_app/validation/address_validator.dart';
import 'package:smart_courier_assistant_app/validation/full_name_validator.dart';
import 'package:smart_courier_assistant_app/validation/phone_number_validator.dart';

enum SaveOrderCategory {
  parcel,
  food,
  docs,
}

class SaveOrderState {
  final FullNameValidator clientFullNameValidator;
  final PhoneNumberValidator clientPhoneNumberValidator;
  final SaveOrderCategory orderCategory;
  final AddressValidator addressValidator;
  final DateTime deliveryBy;
  final FormzSubmissionStatus formStatus;

  SaveOrderState({
    required this.clientFullNameValidator,
    required this.clientPhoneNumberValidator,
    required this.orderCategory,
    required this.addressValidator,
    required this.deliveryBy,
    required this.formStatus,
  });

  factory SaveOrderState.initial() {
    return SaveOrderState(
      clientFullNameValidator: const FullNameValidator.pure(),
      clientPhoneNumberValidator: const PhoneNumberValidator.pure(),
      addressValidator: const AddressValidator.pure(),
      orderCategory: SaveOrderCategory.parcel,
      deliveryBy: DateTime.now(),
      formStatus: FormzSubmissionStatus.initial,
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
    SaveOrderCategory? orderCategory,
    AddressValidator? addressValidator,
    DateTime? deliveryBy,
    FormzSubmissionStatus? formStatus,
  }) {
    return SaveOrderState(
      clientFullNameValidator:
          clientFullNameValidator ?? this.clientFullNameValidator,
      clientPhoneNumberValidator:
          clientPhoneNumberValidator ?? this.clientPhoneNumberValidator,
      orderCategory: orderCategory ?? this.orderCategory,
      addressValidator: addressValidator ?? this.addressValidator,
      deliveryBy: deliveryBy ?? this.deliveryBy,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
