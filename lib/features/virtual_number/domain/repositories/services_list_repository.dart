import '../../data/models/service_model.dart';

abstract class ServicesListRepository{
  Future<List<ServiceModel>> getServices();
}