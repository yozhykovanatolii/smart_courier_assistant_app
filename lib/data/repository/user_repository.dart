import 'package:smart_courier_assistant_app/data/datasource/firebase/firebase_auth/user_auth.dart';
import 'package:smart_courier_assistant_app/data/datasource/firebase/firestore/user_firestore.dart';
import 'package:smart_courier_assistant_app/data/models/user_model.dart';

class UserRepository {
  final UserAuth _userAuth;
  final UserFirestore _userFirestore;

  UserRepository(this._userAuth, this._userFirestore);

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
}
