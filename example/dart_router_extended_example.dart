import 'package:dart_router_extended/dart_router_extended.dart';
import 'package:shelf/shelf.dart';

class IndexRoute extends AbstractRoute {
  IndexRoute()
      : super("/", RouteMethod.get, (Request req) {
          return Response.ok("Test");
        });
}

void main() {
  Controller(pathPrefix: "/test", routes: [IndexRoute()]);
}
