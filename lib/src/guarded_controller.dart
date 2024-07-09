import 'package:dart_router_extended/dart_router_extended.dart';

class GuardedController extends Controller {
  final RouteGuard guard;
  GuardedController(
      {required super.pathPrefix, required super.routes, required this.guard});
}
