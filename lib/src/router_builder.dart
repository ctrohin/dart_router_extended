import 'dart:async';

import 'package:dart_router_extended/dart_router_extended.dart';
import 'package:dart_router_extended/src/guarded_controller.dart';

class RouteBuilder {
  late Router _router;

  /// Public methods
  RouteBuilder(FutureOr<Response> Function(Request) notFoundHandler) {
    _router = Router(notFoundHandler: notFoundHandler);
  }

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

  RouteBuilder route(AbstractRoute route, {RouteGuard? guard}) {
    return _route(route, guard: guard);
  }

  RouteBuilder controller(Controller controller) {
    RouteGuard? guard;
    if (controller is GuardedController) {
      guard = controller.guard;
    }
    for (AbstractRoute route in controller.routes) {
      _route(route, prefix: controller.pathPrefix, guard: guard);
    }
    return this;
  }

  Router getRouter() {
    return _router;
  }

  /// Private methods

  RouteBuilder _route(AbstractRoute route,
      {String prefix = "", RouteGuard? guard}) {
    switch (route.method) {
      case RouteMethod.get:
        return get(prefix + route.path, _guard(route.handler, guard));
      case RouteMethod.post:
        return post(prefix + route.path, _guard(route.handler, guard));
      case RouteMethod.delete:
        return delete(prefix + route.path, _guard(route.handler, guard));
      case RouteMethod.put:
        return put(prefix + route.path, _guard(route.handler, guard));
      case RouteMethod.options:
        return options(prefix + route.path, _guard(route.handler, guard));
      case RouteMethod.head:
        return head(prefix + route.path, _guard(route.handler, guard));
      case RouteMethod.patch:
        return patch(prefix + route.path, _guard(route.handler, guard));
    }
  }

  Function _guard(Function handler, RouteGuard? guard) {
    if (guard == null) {
      return handler;
    } else {
      return (request) async {
        var validationFn = guard.isSecure;
        if (validationFn(request)) {
          final response = await handler(request);
          return response;
        } else {
          return Response.forbidden("");
        }
      };
    }
  }
}
