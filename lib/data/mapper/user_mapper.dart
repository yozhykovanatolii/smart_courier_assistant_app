import 'package:smart_courier_assistant_app/data/models/firestore/user_model.dart';
import 'package:smart_courier_assistant_app/domain/entity/user_entity.dart';

extension UserMapper on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      fullName: fullName,
      phoneNumber: phoneNumber,
      avatar: avatar,
    );
  }
}
