import 'package:phone_activator/features/virtual_number/data/models/translates_model.dart';
import 'package:phone_activator/features/virtual_number/data/repositories/services_translates_impl.dart';
import 'package:phone_activator/features/virtual_number/domain/repositories/services_translates_repository.dart';

class GetTranslatesUseCase {
  final ServicesTranslatesRepository servicesTranslatesRepository =
      const ServicesTranslatesImpl();
  const GetTranslatesUseCase();

  Future<TranslatesModel> getTranslates()async {
    final TranslatesModel translatesModel =  await servicesTranslatesRepository.getTranslates();
    return translatesModel;
  }
}
