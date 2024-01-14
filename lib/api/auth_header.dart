import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ncm/api/api_keys.dart';

import 'package:ncm/prefs/pref_manager.dart';

class AuthHeader {
  const AuthHeader._();

  static Future<Map<String, dynamic>> getLoginSignUpHeaders() async {
    final String? langKey = await PrefManager.getLang();

    return {
      ApiKeys.authorization: null,
      ApiKeys.accept: ApiKeys.applicationJson,
      ApiKeys.locale: langKey ?? 'en',
      ApiKeys.language: 'en',
    };
  }
}
