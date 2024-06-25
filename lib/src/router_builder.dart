import 'package:dart_router_extended/src/abstract_route.dart';
import 'package:dart_router_extended/src/route_method.dart';
import 'package:shelf_router/shelf_router.dart';

class RouteBuilder {
  final Router _router;

  const RouteBuilder(this._router);

  RouteBuilder get(String route, Function handler) {
    _router.get(route, handler);
    return this;
  }

  RouteBuilder post(String route, Function handler) {
    _router.post(route, handler);
    return this;
  }

  RouteBuilder put(String route, Function handler) {
    _router.put(route, handler);
    return this;
  }

  RouteBuilder delete(String route, Function handler) {
    _router.delete(route, handler);
    return this;
  }

  RouteBuilder head(String route, Function handler) {
    _router.head(route, handler);
    return this;
  }

  RouteBuilder patch(String route, Function handler) {
    _router.patch(route, handler);
    return this;
  }

  RouteBuilder options(String route, Function handler) {
    _router.options(route, handler);
    return this;
  }

  RouteBuilder route(AbstractRoute route) {
    switch (route.method) {
      case RouteMethod.get:
        return get(route.path, route.handler);
      case RouteMethod.post:
        return post(route.path, route.handler);
      case RouteMethod.delete:
        return delete(route.path, route.handler);
      case RouteMethod.put:
        return put(route.path, route.handler);
      case RouteMethod.options:
        return options(route.path, route.handler);
      case RouteMethod.head:
        return head(route.path, route.handler);
      case RouteMethod.patch:
        return patch(route.path, route.handler);
    }
  }
}
