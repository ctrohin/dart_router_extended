import 'dart:convert';

import 'package:dart_router_extended/dart_router_extended.dart';

class JsonResponse {
  final int statusCode;
  final String? status;
  final JsonObject? responseObject;

  JsonResponse({required this.statusCode, this.status, this.responseObject});

  static Response ok(
    JsonObject object, {
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
    JsonObject object, {
    Map<String, /* String | List<String> */ Object>? headers,
    Encoding? encoding,
    Map<String, Object>? context,
  }) {
    return Response.notFound(jsonEncode(object),
        headers: headers, encoding: encoding, context: context);
  }

  static Response badRequest(
    JsonObject object, {
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
    JsonObject object, {
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

  static Response okJson(
    ToJson object, {
    Map<String, /* String | List<String> */ Object>? headers,
    Encoding? encoding,
    Map<String, Object>? context,
  }) {
    return ok(
      object.toJson(),
      headers: headers,
      encoding: encoding,
      context: context,
    );
  }

  static Response notFoundJson(
    ToJson object, {
    Map<String, /* String | List<String> */ Object>? headers,
    Encoding? encoding,
    Map<String, Object>? context,
  }) {
    return notFound(object.toJson(),
        headers: headers, encoding: encoding, context: context);
  }

  static Response badRequestJson(
    ToJson object, {
    Map<String, /* String | List<String> */ Object>? headers,
    Encoding? encoding,
    Map<String, Object>? context,
  }) {
    return badRequest(
      object.toJson(),
      headers: headers,
      encoding: encoding,
      context: context,
    );
  }

  static Response unauthorizedJson(
    ToJson object, {
    Map<String, /* String | List<String> */ Object>? headers,
    Encoding? encoding,
    Map<String, Object>? context,
  }) {
    return unauthorized(
      object.toJson(),
      headers: headers,
      encoding: encoding,
      context: context,
    );
  }
}

class ErrorJson implements ToJson {
  final String? message;

  ErrorJson(this.message);

  ErrorJson.empty() : message = null;

  @override
  JsonObject toJson() {
    return {"error": message ?? ""};
  }
}
