import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:weather_app/pages/splash_screen.dart';
import 'package:weather_app/providers/weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: WeatherApp()));
}
class WeatherApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: const SplashScreen(),
      );
  }
}