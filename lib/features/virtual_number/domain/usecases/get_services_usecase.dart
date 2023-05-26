import 'package:phone_activator/features/virtual_number/data/models/service_model.dart';
import 'package:phone_activator/features/virtual_number/data/repositories/services_list_impl.dart';
import 'package:phone_activator/features/virtual_number/domain/repositories/services_list_repository.dart';

class GetServicesUseCase{
  final ServicesListRepository _servicesListRepository = const ServicesListImpl();
  const GetServicesUseCase();

  Future<List<ServiceModel>> getServicesList()async{
    return await _servicesListRepository.getServices();
  }
}