class Forecast {
  final DateTime dtTxt;
  final double temp;
  final String forecasticon;

  Forecast(
      {required this.dtTxt, required this.temp, required this.forecasticon});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      dtTxt: DateTime.parse(json['dt_txt']),
      temp: json['main']['temp'].toDouble(),
      forecasticon: json['weather'][0]['icon'],
    );
  }
}
