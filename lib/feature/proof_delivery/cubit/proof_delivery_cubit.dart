import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:smart_courier_assistant_app/domain/repository/order_repository.dart';
import 'package:smart_courier_assistant_app/exceptions/access_denied_exception.dart';
import 'package:smart_courier_assistant_app/exceptions/data_not_found_exception.dart';
import 'package:smart_courier_assistant_app/exceptions/invalid_credentials_exception.dart';
import 'package:smart_courier_assistant_app/exceptions/invalid_validation_exception.dart';
import 'package:smart_courier_assistant_app/exceptions/permission_deny_exception.dart';
import 'package:smart_courier_assistant_app/exceptions/photo_not_selected_exception.dart';
import 'package:smart_courier_assistant_app/feature/proof_delivery/cubit/proof_delivery_state.dart';
import 'package:smart_courier_assistant_app/validation/courier_comment_validator.dart';

class ProofDeliveryCubit extends Cubit<ProofDeliveryState> {
  final OrderRepository _orderRepository;

  ProofDeliveryCubit(this._orderRepository)
    : super(ProofDeliveryState.initial());

  Future<void> addOrderPhoto() async {
    try {
      final photoUrl = await _orderRepository.getOrderPhoto();
      final updatedOrderPhotos = List<String>.from(state.orderPhotos)
        ..add(photoUrl);
      emit(state.copyWith(orderPhotos: updatedOrderPhotos));
    } on PermissionDenyException {
      emit(
        state.copyWith(
          deliveryErrorType: ProofDeliveryErrorType.storagePermissionDeny,
          formStatus: FormzSubmissionStatus.failure,
        ),
      );
    } on PhotoNotSelectedException {
      emit(
        state.copyWith(
          deliveryErrorType: ProofDeliveryErrorType.photoNotSelected,
          formStatus: FormzSubmissionStatus.failure,
        ),
      );
    }
  }

  void deleteOrderPhoto(String orderPhotoUrl) {
    final updatedList = List<String>.from(state.orderPhotos)
      ..remove(orderPhotoUrl);
    emit(state.copyWith(orderPhotos: updatedList));
  }

  void editCourierComment(String courierComment) {
    emit(
      state.copyWith(
        courierCommentValidator: CourierCommentValidator.dirty(
          courierComment: courierComment,
        ),
      ),
    );
  }

  Future<void> confirmDelivery(String orderId) async {
    emit(state.copyWith(formStatus: FormzSubmissionStatus.inProgress));
    try {
      await _orderRepository.createOrderProofOfDelivery(
        orderId,
        state.courierCommentValidator.value,
        state.orderPhotos,
      );
      emit(state.copyWith(formStatus: FormzSubmissionStatus.success));
    } on InvalidCredentialsException {
      emit(
        state.copyWith(
          deliveryErrorType: ProofDeliveryErrorType.invalidCredentials,
          formStatus: FormzSubmissionStatus.failure,
        ),
      );
    } on InvalidValidationException {
      emit(
        state.copyWith(
          deliveryErrorType: ProofDeliveryErrorType.invalidValidation,
          formStatus: FormzSubmissionStatus.failure,
        ),
      );
    } on AccessDeniedException {
      emit(
        state.copyWith(
          deliveryErrorType: ProofDeliveryErrorType.accessDenied,
          formStatus: FormzSubmissionStatus.failure,
        ),
      );
    } on DataNotFoundException {
      emit(
        state.copyWith(
          deliveryErrorType: ProofDeliveryErrorType.dataNotFound,
          formStatus: FormzSubmissionStatus.failure,
        ),
      );
    }
  }
}
