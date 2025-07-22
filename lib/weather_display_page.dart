import 'package:flutter/material.dart';
import 'package:new_weather_app/current_weather_details_card.dart';
import 'package:new_weather_app/forecast_details_card.dart';
import 'package:new_weather_app/forecast_model.dart';
import 'package:new_weather_app/forecast_services.dart';
import 'package:new_weather_app/other_details_card.dart';
import 'package:new_weather_app/weather_model.dart';
import 'package:new_weather_app/weather_services.dart';

class WeatherDisplayPage extends StatefulWidget {
  const WeatherDisplayPage({super.key});

  @override
  State<WeatherDisplayPage> createState() => _WeatherDisplayPageState();
}

class _WeatherDisplayPageState extends State<WeatherDisplayPage> {
  late Future<Weather> futureWeather;
  late Future<List<Forecast>> futureForecast; // Update to List<Forecast>
  final _weatherServices = WeatherServices();
  final _forecastServices = ForecastServices();

  @override
  void initState() {
    super.initState();
    futureWeather = _weatherServices.fetchWeather();
    futureForecast =
        _forecastServices.fetchForecast(); // Updated to fetch List<Forecast>
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  futureWeather = _weatherServices.fetchWeather();
                  futureForecast = _forecastServices.fetchForecast(); // Updated
                });
              },
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
                size: 25,
              ),
            ),
          ],
          title: const Text(
            "Today Weather Details",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder<Weather>(
          future: futureWeather,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData) {
              return const Center(child: Text('No data available'));
            } else {
              final weather = snapshot.data!;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CurrentWaeatherDetailsCard(
                        cityName: weather.cityName,
                        currentTemp: weather.tempurator,
                        maxTemp: weather.tempMax,
                        minTemp: weather.tempMin,
                        weatherIcon: Icons.wb_sunny_rounded,
                        weatherLine: weather.description,
                      ),
                      const Text(
                        "Forecast Details:",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FutureBuilder<List<Forecast>>(
                        future: futureForecast,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return const Center(
                                child: Text('No data available'));
                          } else {
                            final forecasts = snapshot.data!;
                            return SizedBox(
                              height: 130,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: forecasts.length,
                                itemBuilder: (context, index) {
                                  final forecast = forecasts[index];
                                  return ForecastDetailsCard(
                                    foreCastIcon: Icons
                                        .sunny_snowing, // You might want to use forecast.forecasticon here
                                    hours: forecast.dtTxt.hour.toDouble(),
                                    temp: forecast.temp,
                                  );
                                },
                              ),
                            );
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Other Details:",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              OtherDetailsCard(
                                title: "Wind Speed",
                                value: weather.windspeed.toDouble(),
                                otherIcons: Icons.wind_power_outlined,
                              ),
                              OtherDetailsCard(
                                title: "Humidity",
                                value: weather.humidity.toDouble(),
                                otherIcons: Icons.water_drop_outlined,
                              ),
                              OtherDetailsCard(
                                title: "Pressure",
                                value: weather.pressure.toDouble(),
                                otherIcons: Icons.speed_outlined,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              OtherDetailsCard(
                                title: "Sunrise",
                                value: weather.sunrise.toDouble(),
                                otherIcons: Icons.wb_sunny_outlined,
                              ),
                              OtherDetailsCard(
                                title: "Sunset",
                                value: (weather.sunset / 1000).toDouble(),
                                otherIcons: Icons.nights_stay_outlined,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
