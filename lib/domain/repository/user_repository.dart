import 'package:smart_courier_assistant_app/domain/entity/user_entity.dart';

abstract interface class UserRepository {
  Future<String> getUserImage();
  Future<void> updateUser(
    String avatar,
    String fullName,
    String phoneNumber,
  );
  Stream<UserEntity?> getUserCurrentData();
  Future<void> callUserDialer(String userPhoneNumber);
  Future<void> messageUser(String userPhoneNumber);
}
