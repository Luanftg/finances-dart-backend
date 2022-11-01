import '../core/database/db_configuration.dart';
import '../models/account_model.dart';
import 'dao.dart';

class AccountDAO implements DAO<AccountModel> {
  final DBConfiguration _dbConfiguration;

  AccountDAO(this._dbConfiguration);

  @override
  Future<bool> create(AccountModel value) async {
    var result = await _dbConfiguration.execQuery(
        'INSERT INTO accounts (name, image, balance, id_user) values (?,?,?,?); ',
        [value.name, value.image, value.balance, value.userId]);
    return result.affectedRows > 0;
  }

  @override
  Future<bool> delete(int id) async {
    var result = await _dbConfiguration
        .execQuery('DELETE from accounts where id = ?;', [id]);
    return result.affectedRows > 0;
  }

  @override
  Future<List<AccountModel>> findAll() async {
    var result = await _dbConfiguration.execQuery('SELECT * FROM accounts');
    return result
        .map((r) => AccountModel.fromMap(r.fields))
        .toList()
        .cast<AccountModel>();
  }

  @override
  Future<AccountModel?> findOne(int id) async {
    var result = await _dbConfiguration
        .execQuery('SELECT * FROM accounts where id = ?;', [id]);

    return result.isEmpty ? null : AccountModel.fromMap(result.first.fields);
  }

  @override
  Future<bool> update(AccountModel value) async {
    var result = await _dbConfiguration.execQuery(
        'UPDATE accounts set name = ?,  balance= ?, image = ?, id_user = ? where id = ?; ',
        [value.name, value.balance, value.image, value.userId, value.id]);
    return result.affectedRows > 0;
  }
}
