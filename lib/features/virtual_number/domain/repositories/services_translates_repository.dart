import 'package:phone_activator/features/virtual_number/data/models/translates_model.dart';

abstract class ServicesTranslatesRepository{
  Future<TranslatesModel> getTranslates();
}