import 'package:smart_courier_assistant_app/data/datasource/remote/api/storage_client.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/firebase/firebase_auth/user_auth.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/firebase/firestore/user_firestore.dart';
import 'package:smart_courier_assistant_app/data/mapper/user_mapper.dart';
import 'package:smart_courier_assistant_app/data/service/camera_picker_service.dart';
import 'package:smart_courier_assistant_app/data/service/native_service.dart';
import 'package:smart_courier_assistant_app/domain/entity/user_entity.dart';
import 'package:smart_courier_assistant_app/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserAuth _userAuth;
  final UserFirestore _userFirestore;
  final StorageClient _storageClient;

  UserRepositoryImpl(
    this._userAuth,
    this._userFirestore,
    this._storageClient,
  );

  @override
  Stream<UserEntity?> getUserCurrentData() {
    final userStream = _userAuth.user;
    return userStream.asyncMap((user) async {
      if (user == null) return null;
      final userModel = await _userFirestore.getUserModelById(user.uid);
      return userModel.toEntity();
    });
  }

  @override
  Future<void> updateUser(
    String avatar,
    String fullName,
    String phoneNumber,
  ) async {
    final userId = _userAuth.userId;
    await _userFirestore.saveUser(
      userId,
      avatarUrl: avatar,
      fullName: fullName,
      phoneNumber: phoneNumber,
    );
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
  Future<void> callUserDialer(String userPhoneNumber) async {
    await NativeService.openExtrenal('openDialer', userPhoneNumber);
  }

  @override
  Future<void> messageUser(String userPhoneNumber) async {
    await NativeService.openExtrenal('openWhatsAppChat', userPhoneNumber);
  }
}
