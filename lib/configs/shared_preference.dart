import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference{
  static Future<bool> setEmail(String valueEmail) async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.setString('currentUserEmail', valueEmail);
  }

  static Future<String> getEmail() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString('currentUserEmail');
  }
}