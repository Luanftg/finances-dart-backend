import 'dart:developer';

import 'package:password_dart/password_dart.dart';

import '../to/auth_to.dart';
import 'auth_service.dart';

class LoginService {
  final AuthService _authService;
  LoginService(this._authService);

  Future<int> authenticate(AuthTo to) async {
    try {
      var user = await _authService.findByEmail(to.email);

      if (user == null) return -1;
      return Password.verify(to.password, user.password!) ? user.id! : -1;
    } catch (e) {
      log('[ERROR] -> Authenticate method by email ${to.email} not found!');
    }
    return -1;
  }
}
