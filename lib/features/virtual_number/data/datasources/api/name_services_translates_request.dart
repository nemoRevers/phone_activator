import 'package:dio/dio.dart';

class NameServicesTranslatesRequest{
  static final _dio=Dio();
  const NameServicesTranslatesRequest();

  Future<Response> getTranslates()async{
    return await _dio.get('https://sms-activate.org/stubs/apiMobile.php?owner=6&action=getAllServicesAndAllCountries');
  }
}