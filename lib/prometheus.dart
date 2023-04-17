library prometheus;

import 'dart:core';
import 'package:prometheus/prometheus/delegate.dart';
import 'package:prometheus/prometheus/file_storage.dart';
import 'package:prometheus/prometheus/local_storage.dart';
import 'package:flutter/widgets.dart';

class PrometheusLocalization {
  static late Locale? _selectedLocale;
  Locale? locale;

  PrometheusLocalization(this.locale);

  static const LocalizationsDelegate<PrometheusLocalization> delegate =
      PrometheusLocalizationDelegate();

  static PrometheusLocalization? of(BuildContext context) {
    return Localizations.of<PrometheusLocalization>(
        context, PrometheusLocalization);
  }

  static Locale? get getSelectedLanguageLocale {
    return _selectedLocale;
  }

  static set setSelectedLanguageLocale(Locale newLocale) {
    LocalStorage.presistLang(newLocale.languageCode.toLowerCase());
    _selectedLocale = newLocale;
  }

  static String? get getSelectedLanguageCode {
    return _selectedLocale?.languageCode.toLowerCase();
  }

  static bool isLanguageActice(String languageCode) {
    return getSelectedLanguageCode == languageCode;
  }

  static Future<void> init() async {
    await LocalStorage.loadLanguage();
  }

  static Map<String, String>? _localizedStrings;

  Future<bool> load() async {
    _localizedStrings =
        await FileStorage.loadLanguage(locale ?? const Locale('hu'));
    return true;
  }

  String translate(String key) {
    return _localizedStrings![key] ?? "";
  }
}
