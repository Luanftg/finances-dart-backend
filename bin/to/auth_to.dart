import 'dart:convert';

class AuthTo {
  final String email;
  final String password;

  AuthTo(this.email, this.password);

  factory AuthTo.fromRequest(String body) {
    var map = jsonDecode(body);
    return AuthTo(map['email'], map['password']);
  }
}
