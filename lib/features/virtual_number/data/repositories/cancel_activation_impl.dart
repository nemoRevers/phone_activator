import 'package:dio/src/response.dart';
import 'package:phone_activator/features/virtual_number/data/datasources/api/cancel_activation_request.dart';
import 'package:phone_activator/features/virtual_number/domain/repositories/cancel_activation_repository.dart';

class CancelActivationImpl implements CancelActivationRepository{
  static const CancelActivationRequest _cancelActivationRequest = CancelActivationRequest();

  @override
  Future<Response> cancelActivation() async{
    return await _cancelActivationRequest.cancel();
  }
}