import 'package:dart_router_extended/src/abstract_route.dart';

class Controller {
  final String pathPrefix;
  final List<AbstractRoute> routes;

  Controller({required this.pathPrefix, required this.routes});

  String getPathForRoute(AbstractRoute route) {
    if (routes.contains(route)) {
      return "$pathPrefix${route.path}";
    }
    throw Exception("This route does not belong to this controller.");
  }
}
