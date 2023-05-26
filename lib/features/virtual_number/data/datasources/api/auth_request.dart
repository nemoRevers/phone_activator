import 'package:dio/dio.dart';

class AuthRequest {
  static final _dio = Dio(
    // BaseOptions(
    //   headers: <String, String>{'Accept': 'application/json'},
    // ),
  );
  const AuthRequest();

  Future<Response> auth() async {
    return await _dio.get(
        'https://sms-activate.org/stubs/handler_auth.php?owner=6&email=adwtrafanet@yandex.ru&code=111111&action=confirmEmailByCode');
  }
}
