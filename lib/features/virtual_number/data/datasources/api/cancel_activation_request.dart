import 'package:dio/dio.dart';

class CancelActivationRequest{
  static final _dio = Dio();
  const CancelActivationRequest();

  Future<Response> cancel()async{
    return await _dio.get('https://sms-activate.org/stubs/handler_api.php?refresh_token=57732d7a05fb0fda93e4783c97788a21&sessionId=5210a808d88da491087fcb9ec792291c&owner=6&userid=1155497&action=setStatus&id=1350100086&status=8');
  }
}