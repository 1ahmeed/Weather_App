import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double maxTemp;
  double minTemp;
  double avgTemp;
  String weatherStateName;

  WeatherModel({required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.avgTemp,
    required this.weatherStateName});
  factory WeatherModel.fromJson(dynamic data){
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(date: data['location']['localtime'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        avgTemp: jsonData['avgtemp_c'],
        weatherStateName: jsonData['condition']['text']);
  }

  @override
  String toString() {
    return 'temp=$avgTemp minTemp=$minTemp maxTemp=$maxTemp';
  }

  String? getImage(){
    if(weatherStateName=='Clear'||weatherStateName=='Light Cloud'||weatherStateName=='Sunny') {
      return 'assets/images/clear.png';
    } else if(weatherStateName=='Sleet'||weatherStateName=='Snow'||weatherStateName=='Hail') {
      return 'assets/images/snow.png';
    } else if(weatherStateName=='Heavy Cloud'||weatherStateName=='Partly cloudy') {
      return 'assets/images/cloudy.png';
    } else if(weatherStateName=='Light Rain'||weatherStateName=='Heavy Rain'
        ||weatherStateName=='Showers'||weatherStateName=='Patchy rain possible'|| weatherStateName=='Moderate rain') {
      return 'assets/images/rainy.png';
    } else if(weatherStateName=='Thunderstorm'||weatherStateName=='Thunder') {
      return 'assets/images/thunderstorm.png';
    } else{
      return 'assets/images/clear.png';
    }




  }

  MaterialColor getColor(){
    if(weatherStateName=='Clear'||weatherStateName=='Light Cloud'||weatherStateName=='Sunny') {
      return Colors.orange;
    } else if(weatherStateName=='Sleet'||weatherStateName=='Snow'||weatherStateName=='Hail') {
      return Colors.blue;
    } else if(weatherStateName=='Heavy Cloud'||weatherStateName=='Partly cloudy') {
      return Colors.blueGrey;
    } else if(weatherStateName=='Light Rain'||weatherStateName=='Heavy Rain'
        ||weatherStateName=='Showers'||weatherStateName=='Patchy rain possible'|| weatherStateName=='Moderate rain') {
      return Colors.blue;
    } else if(weatherStateName=='Thunderstorm'||weatherStateName=='Thunder') {
      return Colors.grey;
    } else{
      return Colors.blueGrey;
    }
  }

}