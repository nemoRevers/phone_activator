import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:phone_activator/features/virtual_number/data/datasources/api/name_services_translates_request.dart';
import 'package:phone_activator/features/virtual_number/data/datasources/local_storage/service_name_translates_storage.dart';
import 'package:phone_activator/features/virtual_number/data/models/translates_model.dart';
import 'package:phone_activator/features/virtual_number/domain/repositories/services_translates_repository.dart';

class ServicesTranslatesImpl implements ServicesTranslatesRepository{
  static const NameServicesTranslatesRequest _nameServicesTranslatesRequest = NameServicesTranslatesRequest();
  static final ServiceNameTranslatesStorage _serviceNameTranslatesStorage = ServiceNameTranslatesStorage();
  const ServicesTranslatesImpl();

  @override
  Future<TranslatesModel> getTranslates()async{
    final String? localTranslates = await _serviceNameTranslatesStorage.getTranslates();
    if(localTranslates != null){
      return TranslatesModel.fromJson(json.decode(localTranslates));
    }
    final Response response = await _nameServicesTranslatesRequest.getTranslates();
    return TranslatesModel.fromJson(json.decode(response.data));
  }
}