import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:new_weather_app/forecast_model.dart';

class ForecastServices {
  final String apiKey = "1d41afe0b7dedfc13a7b898ebe125c66";
  final String foreCastUrl =
      "https://api.openweathermap.org/data/2.5/forecast?q=Chennai,ind&APPID=";

  Future<List<Forecast>> fetchForecast() async {
    final response = await http.get(Uri.parse("$foreCastUrl$apiKey"));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> forecastList =
          data['list']; // Adjust based on actual API response structure
      return forecastList.map((json) => Forecast.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load forecast data");
    }
  }
}
