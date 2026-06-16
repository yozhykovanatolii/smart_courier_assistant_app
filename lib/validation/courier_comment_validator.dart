import 'package:formz/formz.dart';

enum CourierCommentInputError {
  empty,
  lengthLessThanTwoHundred,
}

class CourierCommentValidator
    extends FormzInput<String, CourierCommentInputError> {
  const CourierCommentValidator.pure() : super.pure('');

  const CourierCommentValidator.dirty({String courierComment = ''})
    : super.dirty(courierComment);

  @override
  CourierCommentInputError? validator(String courierComment) {
    if (courierComment.isEmpty) return CourierCommentInputError.empty;
    if (courierComment.length > 200) {
      return CourierCommentInputError.lengthLessThanTwoHundred;
    }
    return null;
  }
}
