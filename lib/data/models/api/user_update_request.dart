class UserUpdateRequest {
  final String fullName;
  final String phoneNumber;
  final String avatarUrl;

  UserUpdateRequest({
    required this.fullName,
    required this.phoneNumber,
    required this.avatarUrl,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'full_name': fullName,
      'phone_number': phoneNumber,
      'avatar_url': avatarUrl,
    };
  }
}
