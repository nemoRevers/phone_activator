import 'package:phone_activator/features/virtual_number/data/models/buy_model.dart';
import 'package:phone_activator/features/virtual_number/data/repositories/buy_number_impl.dart';
import 'package:phone_activator/features/virtual_number/domain/repositories/buy_number_repository.dart';

class BuyNumberUseCase{
  static const BuyNumberRepository _buyNumberRepository = BuyNumberImpl();
  const BuyNumberUseCase();

  Future<BuyModel> buy(String refreshToken, String sessionId, String shortName)async{
    return await _buyNumberRepository.buy(refreshToken, sessionId, shortName);
  }
}