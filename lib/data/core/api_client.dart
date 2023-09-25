import 'dart:convert';

import 'package:http/http.dart';

import 'api_constants.dart';
import 'unauthorised_exception.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);

  dynamic get(String path, {Map<dynamic, dynamic>? params}) async {
    final uri = Uri.parse(getPath(path, params));

    final response = await _client.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    await Future.delayed(
      const Duration(seconds: 3),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic post(String path, {Map<dynamic, dynamic>? params}) async {
    final uri = Uri.parse(getPath(path, params));

    final response = await _client.post(
      uri,
      body: jsonEncode(params),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      throw UnauthorizedException();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic deleteWithBody(String path, {Map<dynamic, dynamic>? params}) async {
    Request request = Request('DELETE', Uri.parse(getPath(path, null)));
    request.headers['Content-Type'] = 'application/json';
    if (params != null) {
      request.body = jsonEncode(params);
    }
    final response = await _client.send(request).then(
          (value) => Response.fromStream(value),
        );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      throw UnauthorizedException();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  String getPath(String path, Map<dynamic, dynamic>? params) {
    var paramString = '';
    if (params?.isNotEmpty ?? false) {
      params!.forEach((key, value) {
        paramString += '&$key=$value';
      });
    }
    return '${ApiConstants.BASE_URL}$path?api_key=${ApiConstants.API_KEY}$paramString';
  }
}
