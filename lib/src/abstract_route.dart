import 'package:dart_router_extended/dart_router_extended.dart';
import 'package:dart_router_extended/src/route_method.dart';

abstract class AbstractRoute {
  late String path;
  final RouteMethod method;
  final Function handler;

  AbstractRoute(
    this.path,
    this.method,
    this.handler,
  );
}
