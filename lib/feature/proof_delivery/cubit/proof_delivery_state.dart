import 'package:formz/formz.dart';
import 'package:smart_courier_assistant_app/validation/courier_comment_validator.dart';

enum ProofDeliveryErrorType {
  userNotFound,
  storagePermissionDeny,
  photoNotSelected,
}

class ProofDeliveryState {
  final CourierCommentValidator courierCommentValidator;
  final List<String> orderPhotos;
  final FormzSubmissionStatus formStatus;
  final ProofDeliveryErrorType? deliveryErrorType;

  ProofDeliveryState({
    required this.courierCommentValidator,
    required this.orderPhotos,
    required this.formStatus,
    this.deliveryErrorType,
  });

  factory ProofDeliveryState.initial() {
    return ProofDeliveryState(
      courierCommentValidator: const CourierCommentValidator.pure(),
      orderPhotos: [],
      formStatus: FormzSubmissionStatus.initial,
    );
  }

  bool get isValid {
    return Formz.validate([courierCommentValidator]) && orderPhotos.isNotEmpty;
  }

  ProofDeliveryState copyWith({
    CourierCommentValidator? courierCommentValidator,
    List<String>? orderPhotos,
    FormzSubmissionStatus? formStatus,
    ProofDeliveryErrorType? deliveryErrorType,
  }) {
    return ProofDeliveryState(
      courierCommentValidator:
          courierCommentValidator ?? this.courierCommentValidator,
      orderPhotos: orderPhotos ?? this.orderPhotos,
      formStatus: formStatus ?? this.formStatus,
      deliveryErrorType: deliveryErrorType ?? this.deliveryErrorType,
    );
  }
}
