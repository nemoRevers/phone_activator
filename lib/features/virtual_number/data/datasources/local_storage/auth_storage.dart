import 'package:shared_preferences/shared_preferences.dart';

class AuthStorage {
  final String timeStampKey = 'time_stamp';
  final String userKey = 'user_data';
  SharedPreferences? _sharedPreferences;

  void saveUserData(String json) async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    _sharedPreferences!.setString(userKey, json);
  }

  Future<String?> getUserData() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    return _sharedPreferences!.getString(userKey);
  }

  void setExpirationTime() async {
    final int timeStamp = DateTime.now().millisecondsSinceEpoch + 59 * 60000;
    _sharedPreferences ??= await SharedPreferences.getInstance();
    _sharedPreferences!.setInt(timeStampKey, timeStamp);
  }

  Future<int?> getExpirationTime() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    return _sharedPreferences!.getInt(timeStampKey);
  }

  Future<bool> isSessionExpired() async {
    final int? expirationTime = await getExpirationTime();
    if (expirationTime == null ||
        expirationTime < DateTime.now().millisecondsSinceEpoch) return true;
    return false;
  }
}
