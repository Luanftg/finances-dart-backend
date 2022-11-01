import '../dao/account_dao.dart';
import '../models/account_model.dart';
import 'generic_service.dart';

class AccountService implements GenericService<AccountModel> {
  final AccountDAO _accountDAO;
  AccountService(this._accountDAO);

  @override
  Future<bool> delete(int id) async {
    return _accountDAO.delete(id);
  }

  @override
  Future<List<AccountModel>> findAll() async {
    return _accountDAO.findAll();
  }

  @override
  Future<AccountModel?> findOne(int id) async {
    return _accountDAO.findOne(id);
  }

  @override
  Future<bool> save(AccountModel value) async {
    if (value.id != null) {
      return _accountDAO.update(value);
    } else {
      return _accountDAO.create(value);
    }
  }
}
