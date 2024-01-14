import 'package:ncm/prefs/pref_manager.dart';

class ApiKeys {

  /// Headers
  static Future<Map<String, String>> getAuthHeaders() async {
    return {
      accept: applicationJson,
      locale: (await PrefManager.getLang() ?? "ar"),
    };
  }

  static Future<Map<String, String>> getHeaders() async {
    return {
      authorization: '$keyBearer ${await PrefManager.getToken()}',
      accept: applicationJson,
      locale: (await PrefManager.getLang() ?? "ar")
    };
  }

  /// Keys
  static const authorization = "Authorization";
  static const accept = "Accept";
  static const contentType = "Content-Type";
  static const applicationJson = "application/json";
  static const locale = "locale";
  static const keyBearer = "Bearer";
  static const version = "version";
  static const platform = "Platform";
  static const language = "Language";
  static const timeZone = "Timezone";
  static const country = "country";
  static const utcOffset = "UtcOffset";
  static const timezone = "timezone";


  static const baseApiUrl = 'https://ncm.com';
  static const loginUrl = '$baseApiUrl/Account/login';


}
