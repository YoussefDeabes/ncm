import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:ncm/util/lang/app_localization.dart';

final Locale systemLocale = WidgetsBinding.instance.window.locales.first;

final Locale defaultSupportedLocale = AppLocalizations.supportLocales.first;

// ignore_for_file: constant_identifier_names
enum SupportLanguage { EN, AR }

class LanguageCubit extends HydratedCubit<Locale> {
  static const String _stateJsonKey = "local";
  LanguageCubit() : super(systemLocale);

  void switchLanguage() {
    String languageCode = state.languageCode;
    switch (languageCode) {
      case 'ar':
        _changeToEnglish();
        break;
      case 'en':
        _changeToArabic();
        break;
      default:
        _changeToEnglish();
        break;
    }
  }

  void changeLanguage(SupportLanguage selectedLanguage) {
    if (selectedLanguage == SupportLanguage.AR) {
      _changeToArabic();
    } else if (selectedLanguage == SupportLanguage.EN) {
      _changeToEnglish();
    }
  }

  _changeToEnglish() => emit(const Locale(codeEn, countryUs));
  _changeToArabic() => emit(const Locale(codeAr, countryEg));

  @override
  Locale fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) {
      return const Locale(codeEn, countryUs);
    }
    String languageCode =
        ((json[_stateJsonKey]) as String).toLowerCase().trim();
    if (languageCode == SupportLanguage.AR.name.toLowerCase()) {
      return const Locale(codeAr, countryEg);
    } else {
      return const Locale(codeEn, countryUs);
    }
  }

  @override
  Map<String, dynamic>? toJson(Locale state) {
    return {
      _stateJsonKey: state.languageCode,
    };
  }
}
