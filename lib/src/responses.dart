import 'dart:convert';

import 'package:shelf/shelf.dart';

class JsonResponse {
  static Response ok(
    Map<String, dynamic> object, {
    Map<String, /* String | List<String> */ Object>? headers,
    Encoding? encoding,
    Map<String, Object>? context,
  }) {
    return Response.ok(
      jsonEncode(object),
      headers: headers,
      encoding: encoding,
      context: context,
    );
  }

  static Response notFound(
    Map<String, dynamic> object, {
    Map<String, /* String | List<String> */ Object>? headers,
    Encoding? encoding,
    Map<String, Object>? context,
  }) {
    return Response.notFound(jsonEncode(object),
        headers: headers, encoding: encoding, context: context);
  }

  static Response badRequest(
    Map<String, dynamic> object, {
    Map<String, /* String | List<String> */ Object>? headers,
    Encoding? encoding,
    Map<String, Object>? context,
  }) {
    return Response.badRequest(
      body: jsonEncode(object),
      headers: headers,
      encoding: encoding,
      context: context,
    );
  }

  static Response unauthorized(
    Map<String, dynamic> object, {
    Map<String, /* String | List<String> */ Object>? headers,
    Encoding? encoding,
    Map<String, Object>? context,
  }) {
    return Response.unauthorized(
      jsonEncode(object),
      headers: headers,
      encoding: encoding,
      context: context,
    );
  }
}
