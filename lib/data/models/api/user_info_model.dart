class UserInfoModel {
  final int id;
  final String fullName;
  final String email;
  final String phoneNumber;

  UserInfoModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      id: json['id'] as int,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );
  }
}
