import 'package:smart_courier_assistant_app/data/models/api/user_info_model.dart';
import 'package:smart_courier_assistant_app/domain/entity/user_entity.dart';

extension UserInfoMapper on UserInfoModel {
  UserEntity toEntity() {
    return UserEntity(
      id: id.toString(),
      fullName: fullName,
      phoneNumber: phoneNumber,
      avatar: avatarUrl,
    );
  }
}
