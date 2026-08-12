import 'package:smart_courier_assistant_app/data/datasource/remote/storage_client.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/user_client.dart';
import 'package:smart_courier_assistant_app/data/manager/session_manager.dart';
import 'package:smart_courier_assistant_app/data/mapper/user_info_mapper.dart';
import 'package:smart_courier_assistant_app/data/service/camera_picker_service.dart';
import 'package:smart_courier_assistant_app/data/service/native_service.dart';
import 'package:smart_courier_assistant_app/domain/entity/user_entity.dart';
import 'package:smart_courier_assistant_app/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserClient _userClient;
  final StorageClient _storageClient;
  final SessionManager _sessionManager;

  UserRepositoryImpl(
    this._userClient,
    this._storageClient,
    this._sessionManager,
  );

  @override
  Future<void> callUserDialer(String userPhoneNumber) async {
    await NativeService.openExtrenal('openDialer', userPhoneNumber);
  }

  @override
  Stream<UserEntity?> getUserCurrentData() {
    return _sessionManager.userChanges.map((userModel) {
      return userModel?.toEntity();
    });
  }

  @override
  Future<String> getUserImage() async {
    final userImageFile = await CameraPickerService.pickImageFileFromGallery();
    final userImageUrl = await _storageClient.uploadPhoto(
      userImageFile,
      'users',
    );
    return userImageUrl;
  }

  @override
  Future<void> messageUser(String userPhoneNumber) async {
    await NativeService.openExtrenal(
      'openWhatsAppChat',
      userPhoneNumber,
    );
  }

  @override
  Future<void> updateUser(
    String avatar,
    String fullName,
    String phoneNumber,
  ) async {
    await _userClient.updateUser(
      avatar,
      fullName,
      phoneNumber,
    );
  }

  @override
  Future<void> loadUserData() async {
    final userInfo = await _userClient.getCurrentUserData();
    _sessionManager.update(userInfo);
  }
}
