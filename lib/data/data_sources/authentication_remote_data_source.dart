import 'dart:developer';

import '../core/api_client.dart';
import '../models/request_token_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<RequestTokenModel> getRequestToken();
  Future<RequestTokenModel> validateWithLogin(Map<String, dynamic> requestBody);
  Future<String> creatSession(Map<String, dynamic> requestBody);
  Future<bool> deleteSession(String sessionId);
}

class AuthenticationRemoteDataSourceImpl
    extends AuthenticationRemoteDataSource {
  final ApiClient _client;

  AuthenticationRemoteDataSourceImpl(this._client);

  @override
  Future<String> creatSession(Map<String, dynamic> requestBody) async {
    // final response = await _client.post(
    //   'authentication/session/new',
    //   params: requestBody,
    // );
    // log(response);
    // return response['success'] ? response['session_id'] : null;
    try {
      final response = await _client.post(
        'authentication/session/new',
        params: requestBody,
      );
      if (response['success'] == true) {
        log('Session created successfully');
        return response['session_id'].toString();
      } else {
        log('Session creation failed');
        return 'Error';
      }
    } catch (e) {
      log('Error creating session: $e');
      return 'Error';
    }
  }

  @override
  Future<RequestTokenModel> getRequestToken() async {
    final response = await _client.get('authentication/token/new');
    log(response.toString());
    final requestToken = RequestTokenModel.fromJson(response);
    return requestToken;
  }

  @override
  Future<RequestTokenModel> validateWithLogin(
      Map<String, dynamic> requestBody) async {
    final response = await _client.post(
      'authentication/token/validate_with_login',
      params: requestBody,
    );
    // log(response);
    return RequestTokenModel.fromJson(response);
  }

  @override
  Future<bool> deleteSession(String sessionId) async {
    final response = await _client.deleteWithBody(
      'authentication/session',
      params: {
        'session_id': sessionId,
      },
    );
    return response['success'] ?? false;
  }
}
