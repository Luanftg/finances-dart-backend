import '../../api/accounts_api.dart';
import '../../api/login_api.dart';
import '../../api/user_api.dart';
import '../../dao/account_dao.dart';
import '../../dao/user_dao.dart';
import '../../models/account_model.dart';
import '../../service/account_service.dart';
import '../../service/generic_service.dart';
import '../../service/auth_service.dart';
import '../../service/login_service.dart';
import '../database/db_configuration.dart';
import '../database/mysql_db_configuration.dart';
import '../security/security_service.dart';
import '../security/security_service_imp.dart';
import 'dependency_injector.dart';

class Injects {
  static DependencyInjector initialize() {
    var di = DependencyInjector();

    di.register<DBConfiguration>(() => MySqlDBConfiguration());

    di.register<SecurityService>(() => SecurityServiceImp());

    //Account Injects
    di.register(() => AccountDAO(di.get<DBConfiguration>()));
    di.register<GenericService<AccountModel>>(
        () => AccountService(di.get<AccountDAO>()));
    di.register<AccountsApi>(() => AccountsApi(di.get()));

    // User Injects
    di.register<UserDAO>(() => UserDAO(di.get<DBConfiguration>()));
    di.register<AuthService>(() => AuthService(di.get<UserDAO>()));
    di.register<UserApi>(() => UserApi(di.get<AuthService>()));

    // Login Injects
    di.register<LoginService>(() => LoginService(di.get<AuthService>()));
    di.register<LoginApi>(
        () => LoginApi(di.get<SecurityService>(), di.get<LoginService>()));

    return di;
  }
}
