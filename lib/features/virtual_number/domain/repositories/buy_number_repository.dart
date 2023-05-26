import 'package:phone_activator/features/virtual_number/data/models/buy_model.dart';

abstract class BuyNumberRepository{
  Future<BuyModel> buy(String refreshToken, String sessionId, String shortName);
}