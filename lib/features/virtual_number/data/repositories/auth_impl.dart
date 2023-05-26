import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:phone_activator/features/virtual_number/data/datasources/api/auth_request.dart';
import 'package:phone_activator/features/virtual_number/data/datasources/local_storage/auth_storage.dart';
import 'package:phone_activator/features/virtual_number/data/models/auth_model.dart';
import 'package:phone_activator/features/virtual_number/domain/repositories/auth_repository.dart';

class AuthImpl implements AuthRepository {
  static const AuthRequest _authRequest = AuthRequest();
  static final AuthStorage _authStorage = AuthStorage();
  const AuthImpl();

  @override
  Future<AuthModel> auth() async {
    if (await _authStorage.isSessionExpired()) {
      final Response response = await _authRequest.auth();
      _authStorage.saveUserData(response.data);
      _authStorage.setExpirationTime();
      return AuthModel.fromJson(jsonDecode(response.data));
    }
    final String? userData = await _authStorage.getUserData();
    return AuthModel.fromJson(jsonDecode(userData!));
  }
}
