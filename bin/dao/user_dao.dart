import '../core/database/db_configuration.dart';
import '../models/user_model.dart';
import 'dao.dart';

class UserDAO implements DAO<UserModel> {
  final DBConfiguration _dbConfiguration;

  UserDAO(this._dbConfiguration);

  @override
  Future<bool> create(UserModel value) async {
    var result = await _dbConfiguration.execQuery(
        'INSERT INTO users (name, email, image, password) values (?,?,?,?); ',
        [value.name, value.email, value.image, value.password]);
    return result.affectedRows > 0;
  }

  @override
  Future<bool> delete(int id) async {
    var result = await _dbConfiguration
        .execQuery('DELETE from users where id = ?;', [id]);
    return result.affectedRows > 0;
  }

  @override
  Future<List<UserModel>> findAll() async {
    var result = await _dbConfiguration.execQuery('SELECT * FROM users;');
    return result
        .map((r) => UserModel.fromMap(r.fields))
        .toList()
        .cast<UserModel>();
  }

  @override
  Future<UserModel?> findOne(int id) async {
    var result = await _dbConfiguration
        .execQuery('SELECT * FROM users where id = ?;', [id]);

    return result.affectedRows == 0
        ? null
        : UserModel.fromMap(result.first.fields);
  }

  @override
  Future<bool> update(UserModel value) async {
    var result = await _dbConfiguration.execQuery(
        'UPDATE users set name = ?, password = ?, image = ? where id = ?; ',
        [value.name, value.password, value.image, value.id]);
    return result.affectedRows > 0;
  }

  Future<UserModel?> findByEmail(String email) async {
    var result = await _dbConfiguration
        .execQuery('SELECT * from users where email = ?;', [email]);

    return result.affectedRows == 0
        ? null
        : UserModel.fromEmail(result.first.fields);
  }
}
