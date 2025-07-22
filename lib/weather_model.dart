class Weather {
  final String cityName;
  final String description;
  final double tempurator;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final double windspeed; // Change to double
  final int sunrise;
  final int sunset;
  final String weatherIcon;

  Weather(
      {required this.cityName,
      required this.description,
      required this.tempurator,
      required this.tempMin,
      required this.tempMax,
      required this.pressure,
      required this.humidity,
      required this.windspeed,
      required this.sunrise,
      required this.sunset,
      required this.weatherIcon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'] ?? "",
      description: json['weather'][0]['description'],
      tempurator: (json['main']['temp'] as num).toDouble(),
      tempMin: (json['main']['temp_min'] as num).toDouble(),
      tempMax: (json['main']['temp_max'] as num).toDouble(),
      pressure: json['main']['pressure'],
      humidity: json['main']['humidity'],
      windspeed: (json['wind']['speed'] as num).toDouble(), // Cast to double
      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],
      weatherIcon: json['weather'][0]['icon'],
    );
  }
}
