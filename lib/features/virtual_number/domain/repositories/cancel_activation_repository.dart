import 'package:dio/dio.dart';

abstract class CancelActivationRepository{
  Future<Response> cancelActivation();
}