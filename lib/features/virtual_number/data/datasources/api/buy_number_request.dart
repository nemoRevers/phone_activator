import 'package:dio/dio.dart';

class BuyNumberRequest{
  static final _dio = Dio();
  const BuyNumberRequest();

  Future<Response> buy(String refreshToken, String sessionId, String shortName)async{
    return await _dio.get('https://sms-activate.org/stubs/handler_api.php?refresh_token=$refreshToken&sessionId=$sessionId&owner=6&userid=1398357&country=2&service=$shortName&action=getNumberMobile&forward=0&operator=any');
  }
}