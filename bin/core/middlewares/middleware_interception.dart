import 'package:shelf/shelf.dart';

class MiInterception {
  static Middleware get contentTypeJson {
    return createMiddleware(
      responseHandler: (Response res) => res.change(
        headers: {"content-type": "application/json"},
      ),
    );
  }

  static Middleware get cors {
    final headersPermitidos = {'Access-Control-Allow-Origin': "*"};
    Response? handlerOptions(Request request) {
      if (request.method == "OPTIONS") {
        return Response(200, headers: headersPermitidos);
      } else {
        return null;
      }
    }

    Response addCorsHeader(Response response) =>
        response.change(headers: headersPermitidos);

    return createMiddleware(
      requestHandler: handlerOptions,
      responseHandler: addCorsHeader,
    );
  }
}
