import 'package:password_dart/password_dart.dart';

import '../dao/user_dao.dart';
import 'generic_service.dart';

class AuthService implements GenericService {
  final UserDAO _userDao;
  AuthService(this._userDao);

  @override
  Future<bool> delete(int id) async => _userDao.delete(id);

  @override
  Future<List> findAll() async => _userDao.findAll();

  @override
  Future findOne(int id) async => _userDao.findOne(id);

  @override
  Future<bool> save(value) async {
    if (value.id != null) {
      return _userDao.update(value);
    } else {
      final hash = Password.hash(value.password!, PBKDF2());
      value.password = hash;
      return _userDao.create(value);
    }
  }

  Future findByEmail(String email) async => _userDao.findByEmail(email);
}
