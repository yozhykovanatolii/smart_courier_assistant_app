import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:smart_courier_assistant_app/core/exceptions/geolocation_exception.dart';
import 'package:smart_courier_assistant_app/core/exceptions/user_not_found_exception.dart';
import 'package:smart_courier_assistant_app/data/repository/order_repository.dart';
import 'package:smart_courier_assistant_app/data/repository/route_repository.dart';
import 'package:smart_courier_assistant_app/feature/save_order/cubit/save_order_state.dart';
import 'package:smart_courier_assistant_app/validation/address_validator.dart';
import 'package:smart_courier_assistant_app/validation/full_name_validator.dart';
import 'package:smart_courier_assistant_app/validation/phone_number_validator.dart';

class SaveOrderCubit extends Cubit<SaveOrderState> {
  final OrderRepository _orderRepository;
  final RouteRepository _routeRepository;

  SaveOrderCubit(this._orderRepository, this._routeRepository)
    : super(SaveOrderState.initial());

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

  void setOrderCategory(SaveOrderCategory orderCategory) {
    final currentOrderCategory = state.orderCategory;
    if (currentOrderCategory == orderCategory) return;
    emit(state.copyWith(orderCategory: orderCategory));
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

  Future<void> saveOrder() async {
    emit(state.copyWith(formStatus: FormzSubmissionStatus.inProgress));
    try {
      final routeId = await _routeRepository.createRoute();
      await _orderRepository.saveOrder(
        routeId,
        state.clientFullNameValidator.value,
        state.clientPhoneNumberValidator.value,
        state.addressValidator.value,
        state.deliveryBy,
      );
      emit(state.copyWith(formStatus: FormzSubmissionStatus.success));
    } on UserNotFoundException {
      emit(
        state.copyWith(
          saveOrderErrorType: SaveOrderErrorType.userNotFound,
          formStatus: FormzSubmissionStatus.success,
        ),
      );
    } on GeolocationException {
      emit(
        state.copyWith(
          saveOrderErrorType: SaveOrderErrorType.locationNotFound,
          formStatus: FormzSubmissionStatus.failure,
        ),
      );
    }
  }
}
