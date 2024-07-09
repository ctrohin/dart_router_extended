import 'package:dart_router_extended/dart_router_extended.dart';

abstract class AbstractRoute {
  late String path;
  final RouteMethod method;
  final Handler handler;

  AbstractRoute(
    this.path,
    this.method,
    this.handler,
  );
}
