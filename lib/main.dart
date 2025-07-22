// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:new_weather_app/weather_display_page.dart';

void main() {
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      checkerboardOffscreenLayers: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const WeatherDisplayPage(),
    );
  }
}
