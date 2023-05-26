import 'package:dio/dio.dart';

class ServicesListRequest{
  static final _dio = Dio();
  const ServicesListRequest();

  Future<Response> getServices()async{
    return await _dio.get('https://sms-activate.org/stubs/apiMobile.php?owner=6&action=getAllServices');
  }
}