import 'dart:async';

import 'package:dart_router_extended/dart_router_extended.dart';

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

  RouteBuilder route(AbstractRoute route) {
    return _route(route);
  }

  RouteBuilder controller(Controller controller) {
    for (AbstractRoute route in controller.routes) {
      _route(route, prefix: controller.pathPrefix);
    }
    return this;
  }

  Router getRouter() {
    return _router;
  }

  /// Private methods

  RouteBuilder _route(AbstractRoute route, {String prefix = ""}) {
    RouteBuilder Function(String route, Function handler) mth;
    switch (route.method) {
      case RouteMethod.get:
        mth = get;
        break;
      case RouteMethod.post:
        mth = post;
        break;
      case RouteMethod.delete:
        mth = delete;
        break;
      case RouteMethod.put:
        mth = put;
        break;
      case RouteMethod.options:
        mth = options;
        break;
      case RouteMethod.head:
        mth = head;
        break;
      case RouteMethod.patch:
        mth = patch;
    }
    for (var path in route.paths) {
      mth(prefix + path, route.handler);
    }

    return this;
  }
}
