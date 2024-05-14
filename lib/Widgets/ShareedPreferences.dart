import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();

    // Set the default value only if it's not set
    if (!_prefs!.containsKey('loggedIn')) {
      _prefs?.setBool('loggedIn', false);
    }
  }

  static SharedPreferences get instance => _prefs!;

  static void setLoggedIn(bool value) {
    _prefs!.setBool('loggedIn', value);
  }

  static bool isLoggedIn() {
    return _prefs!.getBool('loggedIn') ?? false;
  }
}
