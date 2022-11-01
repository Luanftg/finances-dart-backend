import 'dart:convert';

import 'package:shelf/shelf.dart';

import 'package:shelf_router/shelf_router.dart';

import '../models/user_model.dart';
import '../service/auth_service.dart';
import 'api.dart';

class UserApi extends Api {
  final AuthService _userService;
  UserApi(this._userService);

  @override
  Handler getHandler({List<Middleware>? middlewares, bool isSecurity = false}) {
    final router = Router();

    router.post('/user', (Request request) async {
      var body = await request.readAsString();
      if (body.isEmpty) return Response(400);
      var user = UserModel.fromRequest(jsonDecode(body));
      var result = await _userService.save(user);

      return result ? Response(201) : Response(500);
    });

    return createHandler(
      router: router,
      isSecurity: isSecurity,
      middlewares: middlewares,
    );
  }
}
