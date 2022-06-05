import 'package:flutter/material.dart';

import 'language/language_en.dart';
import 'language/language_hi.dart';
import 'language_code.dart';
import 'languages.dart';


class AppLocalizationsDelegate extends LocalizationsDelegate<Languages> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => [LanguageCode.ENGLISH, LanguageCode.HINDI].contains(locale.languageCode);

  @override
  Future<Languages> load(Locale locale) => _load(locale);

  static Future<Languages> _load(Locale locale) async {
    switch (locale.languageCode) {
      case LanguageCode.ENGLISH:
        return LanguageEn();
      case LanguageCode.HINDI:
        return LanguageHi();

      default:
        return LanguageEn();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Languages> old) => false;
}
