import 'dart:ui';
import 'dart:io';
import 'package:prometheus/prometheus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<void> loadLanguage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Object? value = sharedPreferences.get("azgardLangTest3");
    String? lang;
    if (value != null) {
      lang = (value as String);
      PrometheusLocalizations.setSelectedLanguageLocale = Locale(lang);
    } else {
      lang = Platform.localeName.substring(0, 2);
      await presistLang(lang);
      PrometheusLocalizations.setSelectedLanguageLocale = Locale(lang);
    }
  }

  static Future<void> presistLang(String lang) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("azgardLangTest3", lang);
  }
}
