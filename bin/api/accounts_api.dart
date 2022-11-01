// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../models/account_model.dart';
import '../service/generic_service.dart';
import 'api.dart';

class AccountsApi extends Api {
  final GenericService<AccountModel> _service;

  AccountsApi(this._service);

  @override
  Handler getHandler({
    List<Middleware>? middlewares,
    bool isSecurity = false,
  }) {
    Router router = Router();

    router.get('/account', (Request req) async {
      String? id = req.url.queryParameters['id'];
      if (id == null) return Response(400);

      var account = await _service.findOne(int.parse(id));
      if (account == null) return Response(404);

      return Response.ok(account.toJson());
    });

    router.get('/accounts', (Request req) async {
      List<AccountModel> accounts = await _service.findAll();
      List<Map> accountsMap = accounts.map((e) => e.toMap()).toList();
      return Response.ok(jsonEncode(accountsMap));
    });

    router.post('/accounts', (Request req) async {
      var body = await req.readAsString();
      var result =
          await _service.save(AccountModel.fromRequest(jsonDecode(body)));
      return result ? Response(201) : Response(500);
    });

    router.put('/accounts', (Request req) async {
      var body = await req.readAsString();
      var result =
          await _service.save(AccountModel.fromRequest(jsonDecode(body)));
      return result ? Response(201) : Response(500);
    });

    router.delete('/accounts', (Request req) async {
      String? id = req.url.queryParameters['id'];
      if (id == null) return Response(400);
      var result = await _service.delete(int.parse(id));
      return result ? Response(200) : Response.internalServerError();
    });

    return createHandler(
        router: router, isSecurity: isSecurity, middlewares: middlewares);
  }
}
