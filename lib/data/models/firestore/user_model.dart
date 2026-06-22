import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String fullName;
  final String phoneNumber;
  final String avatar;

  UserModel({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.avatar,
  });

  UserModel copyWith({
    String? id,
    String? fullName,
    String? phoneNumber,
    String? avatar,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toFirestore() {
    return <String, dynamic>{
      'id': id,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'avatar': avatar,
    };
  }

  factory UserModel.initial(String id) {
    return UserModel(
      id: id,
      fullName: 'User$id',
      phoneNumber: '',
      avatar:
          'https://fojohxjzxvieoakjyzwz.supabase.co/storage/v1/object/public/images/users/default_avatar.jpg',
    );
  }

  factory UserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserModel(
      id: data?['id'] as String,
      fullName: data?['fullName'] as String,
      phoneNumber: data?['phoneNumber'] as String,
      avatar: data?['avatar'] as String,
    );
  }
}
