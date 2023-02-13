import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  WeatherModel? model;
  Future<WeatherModel?> getWeather({
    required String cityName,
  }) async {
   try{
     String baseUrl = 'http://api.weatherapi.com/v1';
     String apiKey = '0024b98f24294aa38ff165814230902';
     Uri url = Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
     http.Response response = await http.get(url);
     Map<String, dynamic> data = jsonDecode(response.body);
     model= WeatherModel.fromJson(data);
   }catch(e){
     print(e);
   }
    return model;
     }
}
