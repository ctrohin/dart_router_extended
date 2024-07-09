import 'package:dart_router_extended/dart_router_extended.dart';

abstract class RouteGuard {
  const RouteGuard();
  bool isSecure(Request request);
}

final class DefaultRouteGuard extends RouteGuard {
  const DefaultRouteGuard();
  @override
  bool isSecure(Request request) {
    return true;
  }
}

const DefaultRouteGuard defaultGuard = DefaultRouteGuard();
