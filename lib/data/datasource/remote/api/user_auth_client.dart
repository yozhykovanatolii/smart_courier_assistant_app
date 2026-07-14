import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:smart_courier_assistant_app/data/models/api/register_request.dart';
import 'package:smart_courier_assistant_app/exceptions/register_exception.dart';

class UserAuthClient {
  Future<void> registerUser(
    String email,
    String password,
    String fullName,
    String phoneNumber,
  ) async {
    final request = RegisterRequest(
      fullName: fullName,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
    );
    final response = await http.post(
      Uri.parse('http://192.168.1.6:8000/auth/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(request.toJson()),
    );
    if (response.statusCode != 201) {
      throw RegisterException.convertFromCode(response.statusCode);
    }
  }
}
