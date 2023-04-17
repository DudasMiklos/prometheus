import 'dart:core';
import 'package:flutter/widgets.dart';
import 'package:prometheus/prometheus.dart';

class PrometheusLocalizationDelegate
    extends LocalizationsDelegate<PrometheusLocalization> {
  const PrometheusLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['hu', 'en'].contains(locale.languageCode);
  }

  @override
  Future<PrometheusLocalization> load(Locale locale) async {
    PrometheusLocalization localizations = PrometheusLocalization(locale);

    await localizations.load();

    return localizations;
  }

  @override
  bool shouldReload(LocalizationsDelegate<PrometheusLocalization> old) {
    return false;
  }
}
