import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:smart_courier_assistant_app/core/exceptions/permission_deny_exception.dart';
import 'package:smart_courier_assistant_app/core/exceptions/photo_not_selected_exception.dart';
import 'package:smart_courier_assistant_app/core/exceptions/route_not_found_exception.dart';
import 'package:smart_courier_assistant_app/core/exceptions/user_not_found_exception.dart';
import 'package:smart_courier_assistant_app/data/repository/order_repository_impl.dart';
import 'package:smart_courier_assistant_app/domain/repository/delivery_repository.dart';
import 'package:smart_courier_assistant_app/feature/proof_delivery/cubit/proof_delivery_state.dart';
import 'package:smart_courier_assistant_app/validation/courier_comment_validator.dart';

class ProofDeliveryCubit extends Cubit<ProofDeliveryState> {
  final OrderRepositoryImpl _orderRepository;
  final DeliveryRepository _deliveryRepository;

  ProofDeliveryCubit(this._orderRepository, this._deliveryRepository)
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
      await _deliveryRepository.createProofOfDelivery(
        orderId,
        state.courierCommentValidator.value,
        state.orderPhotos,
      );
      emit(state.copyWith(formStatus: FormzSubmissionStatus.success));
    } on UserNotFoundException {
      emit(
        state.copyWith(
          deliveryErrorType: ProofDeliveryErrorType.userNotFound,
          formStatus: FormzSubmissionStatus.failure,
        ),
      );
    } on RouteNotFoundException {
      emit(
        state.copyWith(
          deliveryErrorType: ProofDeliveryErrorType.routeNotFound,
          formStatus: FormzSubmissionStatus.failure,
        ),
      );
    }
  }
}
