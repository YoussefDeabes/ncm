import 'package:ncm/prefs/pref_keys.dart';
import 'package:ncm/prefs/pref_util.dart';

class PrefManager {
  static Future<bool> setLang(String? data) async {
    return await PrefUtils.setString(PrefKeys.lang, data!);
  }

  static Future<String?> getLang() async {
    return await PrefUtils.getString(PrefKeys.lang);
  }

  static Future<void> setLoggedIn({bool value = true}) async {
    await PrefUtils.setBool(PrefKeys.isLoggedIn, value);
  }

  static Future<bool> isLoggedIn() async {
    return await PrefUtils.getBool(PrefKeys.isLoggedIn);
  }

  static Future<void> setToken(String? data) async {
    await PrefUtils.setString(PrefKeys.token, data!);
  }

  static Future<String?> getToken() async {
    return await PrefUtils.getString(PrefKeys.token);
  }

  static Future<void> setUsername(String? data) async {
    await PrefUtils.setString(PrefKeys.username, data!);
  }
  static Future<String?> getUsername() async {
    return await PrefUtils.getString(PrefKeys.username);
  }
}
