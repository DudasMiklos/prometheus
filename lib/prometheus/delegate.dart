import 'dart:core';
import 'package:flutter/widgets.dart';
import 'package:prometheus/prometheus.dart';

class PrometheusLocalizationsDelegate
    extends LocalizationsDelegate<PrometheusLocalizations> {
  const PrometheusLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['hu', 'en'].contains(locale.languageCode);
  }

  @override
  Future<PrometheusLocalizations> load(Locale locale) async {
    PrometheusLocalizations localizations = PrometheusLocalizations(locale);

    await localizations.load();

    return localizations;
  }

  @override
  bool shouldReload(LocalizationsDelegate<PrometheusLocalizations> old) {
    return false;
  }
}
