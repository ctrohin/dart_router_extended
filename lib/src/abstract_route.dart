import 'package:dart_router_extended/dart_router_extended.dart';

abstract class AbstractRoute {
  late List<String> paths;
  final Method method;
  final Function handler;

  AbstractRoute(
    this.paths,
    this.method,
    this.handler,
  );
}
