
import 'package:dio/dio.dart';
import 'package:phone_activator/features/virtual_number/data/datasources/api/services_list_request.dart';
import 'package:phone_activator/features/virtual_number/data/models/service_model.dart';
import 'package:phone_activator/features/virtual_number/domain/repositories/services_list_repository.dart';

class ServicesListImpl implements ServicesListRepository {
  static const ServicesListRequest _servicesListRequest = ServicesListRequest();
  const ServicesListImpl();

  @override
  Future<List<ServiceModel>> getServices() async {
    final Response response = await _servicesListRequest.getServices();
    final List<ServiceModel> services = servicesModelFromJson(response.data);
    return services;
  }
}
