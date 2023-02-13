import 'package:flutter/foundation.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier{

  WeatherModel? _weatherData;
  String? cityName;

  WeatherModel? get weatherData => _weatherData;

  set weatherData(WeatherModel? weather) {
    _weatherData = weather;
    notifyListeners();
  }

}