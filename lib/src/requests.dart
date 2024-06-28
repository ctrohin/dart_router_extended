import 'dart:convert';

import 'package:shelf/shelf.dart';

class JsonRequest {
  final Request req;

  JsonRequest(this.req);

  Future<Map<String, dynamic>> getJsonObject() async {
    var obj = await req.readAsString().then((str) => jsonDecode(str));
    return obj as Map<String, dynamic>;
  }

  Future<T> getObject<T>(T Function(Map<String, dynamic>) objectFactory) async {
    var obj = await req.readAsString().then((str) => jsonDecode(str));
    return objectFactory(obj);
  }
}
