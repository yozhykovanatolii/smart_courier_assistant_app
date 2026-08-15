class RegisterRequest {
  final String fullName;
  final String email;
  final String password;
  final String phoneNumber;

  const RegisterRequest({
    required this.fullName,
    required this.email,
    required this.password,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'email': email,
      'password': password,
      'phone_number': phoneNumber,
    };
  }
}
