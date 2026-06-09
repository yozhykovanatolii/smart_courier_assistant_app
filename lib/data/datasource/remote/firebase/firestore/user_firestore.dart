import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_courier_assistant_app/data/models/user_model.dart';

class UserFirestore {
  final _firestore = FirebaseFirestore.instance;

  Future<void> saveUser(
    String id, {
    String? fullName,
    String? phoneNumber,
    String? avatarUrl,
  }) async {
    UserModel user = UserModel.initial(id);
    user = user.copyWith(
      fullName: fullName,
      phoneNumber: phoneNumber,
      avatar: avatarUrl,
    );
    final docReference = _getUserDocumentReference(user.id);
    await docReference.set(user);
  }

  Future<bool> isUserExist(String id) async {
    final docRef = _getUserDocumentReference(id);
    final snapshot = await docRef.get();
    return snapshot.exists;
  }

  Future<UserModel> getUserModelById(String id) async {
    final docRef = _getUserDocumentReference(id);
    final snapshot = await docRef.get();
    final userModel = snapshot.data()!;
    return userModel;
  }

  DocumentReference<UserModel> _getUserDocumentReference(String id) {
    return _firestore
        .collection('users')
        .doc(id)
        .withConverter(
          fromFirestore: UserModel.fromFirestore,
          toFirestore: (UserModel userModel, options) =>
              userModel.toFirestore(),
        );
  }
}
