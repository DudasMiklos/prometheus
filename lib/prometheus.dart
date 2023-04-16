library prometheus;

import 'dart:convert';
import 'dart:core';
import 'package:prometheus/prometheus/delegate.dart';
import 'package:prometheus/prometheus/local_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class PrometheusLocalizations {
  static late Locale? _selectedLocale;
  Locale? locale;

  PrometheusLocalizations(this.locale);

  static const LocalizationsDelegate<PrometheusLocalizations> delegate =
      PrometheusLocalizationsDelegate();

  static PrometheusLocalizations? of(BuildContext context) {
    return Localizations.of<PrometheusLocalizations>(
        context, PrometheusLocalizations);
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
    String jsonString =
        await rootBundle.loadString("lang/${locale!.languageCode}.json");

    Map<String, dynamic> jsonMap = jsonDecode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  String translate(String key) {
    return _localizedStrings![key] ?? "";
  }
}
