import 'package:dart_router_extended/dart_router_extended.dart';

class IndexRoute extends AbstractRoute {
  IndexRoute()
      : super(["/"], Method.get, (Request req) {
          return Response.ok("Test");
        });
}

void main() {
  Controller(pathPrefix: "/test", routes: [IndexRoute()]);
}
