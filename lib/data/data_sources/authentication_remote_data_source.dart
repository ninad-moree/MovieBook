import 'dart:developer';

import 'package:moviebook/data/core/api_client.dart';
import 'package:moviebook/data/models/request_token_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<RequestTokenModel> getRequestToken();
  Future<RequestTokenModel> validateWithLogin(Map<String, dynamic> requestBody);
  Future<String> creatSession(Map<String, dynamic> requestBody);
}

class AuthenticationRemoteDataSourceImpl
    extends AuthenticationRemoteDataSource {
  final ApiClient _client;

  AuthenticationRemoteDataSourceImpl(this._client);

  @override
  Future<String> creatSession(Map<String, dynamic> requestBody) async {
    final response = await _client.post(
      'authentication/session/new',
      params: requestBody,
    );
    log(response);
    return response['success'] ? response['session_id'] : null;
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
    log(response);
    return RequestTokenModel.fromJson(response);
  }
}
