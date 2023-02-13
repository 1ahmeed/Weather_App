import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/home_screen.dart';
import 'package:weather_app/pages/splash_screen.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/styles/themes.dart';

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
        theme: ThemeData(
          // appBarTheme: const AppBarTheme(
          //   systemOverlayStyle:  SystemUiOverlayStyle(
          //     statusBarIconBrightness: Brightness.dark,
          //     statusBarColor: Colors.white,
          //   )
          // ),
         // primarySwatch: Colors.blue,


        ),
        home: SplashScreen(),
      );
  }
}