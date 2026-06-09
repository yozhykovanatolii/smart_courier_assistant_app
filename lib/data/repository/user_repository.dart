import 'package:smart_courier_assistant_app/data/datasource/remote/firebase/firebase_auth/user_auth.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/firebase/firestore/user_firestore.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/supabase/supabase_storage.dart';
import 'package:smart_courier_assistant_app/data/models/user_model.dart';
import 'package:smart_courier_assistant_app/data/service/camera_picker_service.dart';

class UserRepository {
  final UserAuth _userAuth;
  final UserFirestore _userFirestore;
  final SupabaseStorage _supabaseStorage;

  UserRepository(
    this._userAuth,
    this._userFirestore,
    this._supabaseStorage,
  );

  Stream<UserModel?> getUserCurrentData() {
    final userStream = _userAuth.user;
    return userStream.asyncMap((user) async {
      if (user == null) return null;
      final userModel = await _userFirestore.getUserModelById(user.uid);
      return userModel;
    });
  }

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

  Future<String> getUserImage() async {
    final userImageFile = await CameraPickerService.pickImageFileFromGallery();
    final userImageUrl = await _supabaseStorage.saveImage(
      userImageFile,
      'users',
    );
    return userImageUrl;
  }
}
