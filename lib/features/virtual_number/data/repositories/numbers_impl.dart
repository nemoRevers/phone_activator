import 'package:hive/hive.dart';
import 'package:phone_activator/features/virtual_number/data/datasources/local_storage/numbers_storage.dart';
import 'package:phone_activator/features/virtual_number/data/models/buy_model.dart';
import 'package:phone_activator/features/virtual_number/domain/repositories/numbers_repository.dart';

class NumbersImpl implements NumbersRepository{
  static final NumbersBoxStorage _numbersStorage = NumbersBoxStorage.instance;
  const NumbersImpl();

  @override
  void addNumber(BuyModel buyInfo) async{
    final Box box = await _numbersStorage.openNumbersBox();
    box.add(buyInfo);
  }



  @override
  Future<List<BuyModel>> getNumbers() async{
    final Box<BuyModel> box = await _numbersStorage.openNumbersBox();
    return box.values.toList();
  }

  @override
  void removeNumber(int index)async {
    final Box<BuyModel> box = await _numbersStorage.openNumbersBox();
    return box.deleteAt(index);
  }
}