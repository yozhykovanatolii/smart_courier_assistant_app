class UserInfoModel {
  final int id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String avatarUrl;

  UserInfoModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.avatarUrl,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      id: json['id'] as int,
      fullName: json['full_name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phone_number'] as String,
      avatarUrl: json['avatar_url'] as String,
    );
  }
}
