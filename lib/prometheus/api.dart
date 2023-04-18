import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prometheus/prometheus.dart';

class Api {
  static Future<Map<String, dynamic>> fetchTranslationVersion() async {
    final response = await http.get(Uri.parse(
        PrometheusLocalization.getHostname +
            PrometheusLocalization.getVersionPath));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data'); //TODO :D
    }
  }

  static Future<Map<String, dynamic>> fetchTranslations() async {
    final response = await http.get(Uri.parse(
        PrometheusLocalization.getHostname +
            PrometheusLocalization.getTranslationsPath));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data'); //TODO :D
    }
  }
}
