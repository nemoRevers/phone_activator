
import 'package:hive/hive.dart';
import 'package:phone_activator/features/virtual_number/data/models/buy_model.dart';

class NumbersBoxStorage{
  final Map<String, int> _boxCounter = <String, int>{};


  static final NumbersBoxStorage instance = NumbersBoxStorage._();

  NumbersBoxStorage._();

  Future<Box<BuyModel>> openNumbersBox()async{
    return _openBox('numbers', 0, BuyModelAdapter());
  }

  Future<void> closeBox<T>(Box<T> box) async {
    if (!box.isOpen) {
      _boxCounter.remove(box.name);
      return;
    }

    int count = _boxCounter[box.name] ?? 1;
    count -= 1;
    _boxCounter[box.name] = count;
    if (count > 0) return;

    await box.compact();
    await box.close();
  }

  Future<Box<T>> _openBox<T>(
      String name,
      int typeId,
      TypeAdapter<T> adapter,
      ) async {
    if (Hive.isBoxOpen(name)) {
      final count = _boxCounter[name] ?? 1;
      _boxCounter[name] = count + 1;
      return Hive.box(name);
    }

    _boxCounter[name] = 1;
    if (!Hive.isAdapterRegistered(typeId)) {
      Hive.registerAdapter(adapter);
    }
    return Hive.openBox<T>(name);
  }
}