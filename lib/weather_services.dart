import 'dart:convert';

import 'package:http/http.dart' as http;

import 'weather_model.dart';

class WeatherServices {
  final String apiKey = "1d41afe0b7dedfc13a7b898ebe125c66";
  final String weatherUrl =
      "https://api.openweathermap.org/data/2.5/weather?q=Chennai,ind&APPID=";

  Future<Weather> fetchWeather() async {
    final response = await http.get(Uri.parse("$weatherUrl$apiKey"));
    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load weather data");
    }
  }
}
