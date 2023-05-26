import 'package:shared_preferences/shared_preferences.dart';

class ServiceNameTranslatesStorage {
  final String key = 'translates';
  SharedPreferences? _sharedPreferences;

  Future<void> setTranslates(String value) async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    await _sharedPreferences!.setString(key, value);
  }

  Future<String?> getTranslates() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    return _sharedPreferences!.getString(key);
  }
}
