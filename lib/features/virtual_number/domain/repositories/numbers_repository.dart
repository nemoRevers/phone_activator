import 'package:phone_activator/features/virtual_number/data/models/buy_model.dart';

abstract class NumbersRepository{
  Future<List<BuyModel>>  getNumbers();
  void addNumber(BuyModel buyInfo);
  void removeNumber(int index){}
}