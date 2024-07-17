import 'dart:convert';
import 'dart:io';

import 'package:dart_router_extended/dart_router_extended.dart';

class HttpRequest {
  static Future<JsonResponse> requestJson(
    Method method,
    String host,
    int port,
    String path, {
    JsonObject? body,
    SecurityContext? securityContext,
    Map<String, Object>? headers,
  }) async {
    HttpClient cli = HttpClient(context: securityContext);
    Function(String, int, String) fn;
    switch (method) {
      case Method.post:
        fn = cli.post;
        break;
      case Method.delete:
        fn = cli.delete;
        break;
      case Method.get:
        fn = cli.get;
        break;
      case Method.patch:
        fn = cli.patch;
        break;
      case Method.put:
        fn = cli.put;
        break;
      case Method.head:
        fn = cli.head;
        break;
      case Method.options:
        fn = cli.get;
        break;
    }

    HttpClientRequest req = await fn(host, port, path);
    if (headers != null) {
      headers.forEach(
        (key, value) {
          req.headers.set(key, value);
        },
      );
    }
    if (body != null) {
      req.write(jsonEncode(body));
    }

    HttpClientResponse response = await req.close();
    JsonObject? responseObject;
    // Process the response
    final stringData = await response.transform(utf8.decoder).join();
    if (stringData.isNotEmpty) {
      responseObject = jsonDecode(stringData);
    }
    return JsonResponse(
      statusCode: response.statusCode,
      status: stringData,
      responseObject: responseObject,
    );
  }
}
