import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:smart_courier_assistant_app/exceptions/access_denied_exception.dart';
import 'package:smart_courier_assistant_app/exceptions/data_not_found_exception.dart';
import 'package:smart_courier_assistant_app/exceptions/geolocation_exception.dart';
import 'package:smart_courier_assistant_app/exceptions/invalid_credentials_exception.dart';
import 'package:smart_courier_assistant_app/exceptions/invalid_validation_exception.dart';
import 'package:smart_courier_assistant_app/domain/entity/order_entity.dart';
import 'package:smart_courier_assistant_app/domain/repository/order_repository.dart';
import 'package:smart_courier_assistant_app/feature/save_order/cubit/save_order_state.dart';
import 'package:smart_courier_assistant_app/validation/address_validator.dart';
import 'package:smart_courier_assistant_app/validation/full_name_validator.dart';
import 'package:smart_courier_assistant_app/validation/phone_number_validator.dart';

class SaveOrderCubit extends Cubit<SaveOrderState> {
  final OrderRepository _orderRepository;

  SaveOrderCubit(this._orderRepository) : super(SaveOrderState.initial());

  void setClientFullName(String clientFullName) {
    emit(
      state.copyWith(
        clientFullNameValidator: FullNameValidator.dirty(
          fullName: clientFullName,
        ),
      ),
    );
  }

  void setClientPhoneNumber(String clientPhoneNumber) {
    emit(
      state.copyWith(
        clientPhoneNumberValidator: PhoneNumberValidator.dirty(
          phoneNumber: clientPhoneNumber,
        ),
      ),
    );
  }

  void setOrderAddress(String address) {
    emit(
      state.copyWith(
        addressValidator: AddressValidator.dirty(address: address),
      ),
    );
  }

  void chooseDeliveryTime(int hour, int minute) {
    DateTime currentDeliveryBy = state.deliveryBy;
    if (currentDeliveryBy.hour == hour && currentDeliveryBy.minute == minute) {
      return;
    }
    currentDeliveryBy = currentDeliveryBy.copyWith(
      hour: hour,
      minute: minute,
    );
    emit(state.copyWith(deliveryBy: currentDeliveryBy));
  }

  Future<void> deleteOrder(String orderId) async {
    emit(state.copyWith(deletingStatus: FormzSubmissionStatus.inProgress));
    try {
      await _orderRepository.deleteOrder(orderId);
      emit(state.copyWith(deletingStatus: FormzSubmissionStatus.success));
    } on InvalidCredentialsException {
      emit(
        state.copyWith(
          saveOrderErrorType: SaveOrderErrorType.invalidCredentials,
          deletingStatus: FormzSubmissionStatus.failure,
        ),
      );
    } on AccessDeniedException {
      emit(
        state.copyWith(
          saveOrderErrorType: SaveOrderErrorType.accessDenied,
          deletingStatus: FormzSubmissionStatus.failure,
        ),
      );
    } on DataNotFoundException {
      emit(
        state.copyWith(
          saveOrderErrorType: SaveOrderErrorType.dataNotFound,
          deletingStatus: FormzSubmissionStatus.failure,
        ),
      );
    }
  }

  void editOrder(OrderEntity? order) {
    if (order != null) {
      emit(
        state.copyWith(
          addressValidator: AddressValidator.dirty(address: order.address.name),
          clientFullNameValidator: FullNameValidator.dirty(
            fullName: order.clientFullName,
          ),
          clientPhoneNumberValidator: PhoneNumberValidator.dirty(
            phoneNumber: order.clientPhoneNumber,
          ),
          deliveryBy: order.deliveryBy,
        ),
      );
    }
  }

  Future<void> saveOrder(OrderEntity? order) async {
    emit(state.copyWith(formStatus: FormzSubmissionStatus.inProgress));
    try {
      await _orderRepository.saveOrder(
        state.clientFullNameValidator.value,
        state.clientPhoneNumberValidator.value,
        state.addressValidator.value,
        state.deliveryBy,
        currentOrder: order,
      );
      emit(state.copyWith(formStatus: FormzSubmissionStatus.success));
    } on InvalidCredentialsException {
      emit(
        state.copyWith(
          saveOrderErrorType: SaveOrderErrorType.invalidCredentials,
          formStatus: FormzSubmissionStatus.success,
        ),
      );
    } on InvalidValidationException {
      emit(
        state.copyWith(
          formStatus: FormzSubmissionStatus.failure,
          saveOrderErrorType: SaveOrderErrorType.invalidValidation,
        ),
      );
    } on GeolocationException {
      emit(
        state.copyWith(
          saveOrderErrorType: SaveOrderErrorType.locationNotFound,
          formStatus: FormzSubmissionStatus.failure,
        ),
      );
    } on AccessDeniedException {
      emit(
        state.copyWith(
          saveOrderErrorType: SaveOrderErrorType.accessDenied,
          deletingStatus: FormzSubmissionStatus.failure,
        ),
      );
    } on DataNotFoundException {
      emit(
        state.copyWith(
          saveOrderErrorType: SaveOrderErrorType.dataNotFound,
          deletingStatus: FormzSubmissionStatus.failure,
        ),
      );
    }
  }
}
