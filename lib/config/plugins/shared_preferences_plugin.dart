import 'package:shared_preferences/shared_preferences.dart';

class SharedReferencesPlugin {
  static final Future<SharedPreferences> _getPrefs = SharedPreferences.getInstance();

  static Future<void> setBool(String key, bool value) async {
    final prefs = await _getPrefs;
    await prefs.setBool(key, value);
  }

  static Future<bool> getBool(String key, { bool defaultValue = false }) async {
    final prefs = await _getPrefs;
    return prefs.getBool(key) ?? defaultValue;
  }
}