import 'dart:async';
import 'package:smart_courier_assistant_app/data/models/firestore/user_model.dart';

class SessionManager {
  final StreamController<UserModel?> _controller =
      StreamController<UserModel?>.broadcast();

  Stream<UserModel?> get userChanges => _controller.stream;

  void update(UserModel? user) {
    _controller.add(user);
  }
}
