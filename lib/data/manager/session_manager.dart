import 'dart:async';
import 'package:smart_courier_assistant_app/data/models/api/user_info_model.dart';

class SessionManager {
  final StreamController<UserInfoModel?> _controller =
      StreamController<UserInfoModel?>.broadcast();

  Stream<UserInfoModel?> get userChanges => _controller.stream;

  void update(UserInfoModel? user) {
    _controller.sink.add(user);
  }
}
