import 'package:dart_router_extended/src/abstract_route.dart';

class Controller {
  final String pathPrefix;
  final List<AbstractRoute> routes;

  Controller({required this.pathPrefix, required this.routes});

  List<String> getPathsForRoute(AbstractRoute route) {
    if (routes.contains(route)) {
      return List.generate(
          route.paths.length, (idx) => "$pathPrefix${route.paths[idx]}");
    }
    throw Exception("This route does not belong to this controller.");
  }
}
