
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

// class NumbersStorage {
//   SharedPreferences? _sharedPreferences;
//   NumbersStorage(){
//     initStorage();
//   }
//
//   void initStorage() async {
//     _sharedPreferences ??= await SharedPreferences.getInstance();
//   }
//
//   void addNumber(BuyModel buyInfo) async {
//     int numbersCount = _sharedPreferences?.getInt('count') ?? 0;
//     _sharedPreferences ??= await SharedPreferences.getInstance();
//     _sharedPreferences!.setString(
//       '${numbersCount += 1}',
//       jsonEncode(buyInfo.toJson()),
//     );
//     print(json.encode(buyInfo.toJson()));
//     _sharedPreferences?.setInt('count', numbersCount);
//     print(_sharedPreferences!.getString(numbersCount.toString()));
//   }
//
//   Future<List<BuyModel>> getNumbers() async {
//     final int numbersCount = _sharedPreferences?.getInt('count') ?? 0;
//     _sharedPreferences ??= await SharedPreferences.getInstance();
//     final List<BuyModel> models = [];
//     for (int i = 1; i <= numbersCount; i++) {
//       final modelString = _sharedPreferences!.getString(i.toString());
//       models.add(BuyModel.fromJson(jsonDecode(modelString!) as Map<String,dynamic>));
//     }
//     return models;
//   }
// }
