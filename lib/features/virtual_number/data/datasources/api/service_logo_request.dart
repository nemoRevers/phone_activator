import 'package:dio/dio.dart';

class ServiceLogoRequest {
  static final _dio = Dio(
    // BaseOptions(
    //     responseType: ResponseType.bytes,
    //     followRedirects: false,
    //     validateStatus: (int? status) => status == 200),
  );
  const ServiceLogoRequest();

  Future<Response> getImage(String shortName) async {
    return await _dio.get(
        'https://smsactivate.s3.eu-central-1.amazonaws.com/assets/ico/${shortName}0.webp');
  }
}
