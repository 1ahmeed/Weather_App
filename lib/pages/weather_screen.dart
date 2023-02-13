import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';


class WeatherScreen extends StatelessWidget {
 WeatherModel? weatherData;

  @override

  Widget build(BuildContext context) {
    weatherData= Provider.of<WeatherProvider>(context).weatherData;
    return ConditionalBuilder(
      condition: weatherData !=null,
      builder: (context) => buildWeatherItem(context),
      fallback: (context) => Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'there is no weather 😔 start',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                'searching now 🔍',
                style: TextStyle(
                  fontSize: 30,
                ),
              )
            ],
          ),
        ),
      )
    );
  }

  Widget buildWeatherItem(context)=>
      Scaffold(
        appBar: AppBar(
          backgroundColor:Provider.of<WeatherProvider>(context).weatherData ==null ?
          Colors.blue: Provider.of<WeatherProvider>(context).weatherData!.getColor() ,
          title: const Text('Weather App'),
        ),
        body:  Container(
          decoration:BoxDecoration(
            gradient: LinearGradient(
              colors: [
                 weatherData!.getColor(),
                 weatherData!.getColor()[300]!,
                 weatherData!.getColor()[100]!,
              ],
                  begin:Alignment.topCenter ,
              end:Alignment.bottomCenter ,
            )
          ) ,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(Provider.of<WeatherProvider>(context).cityName!,style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold
              ),),
              Text('update: ${weatherData!.date}',style: Theme.of(context).textTheme.caption?.copyWith(
                fontSize: 15
              ),),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 30,),
                  Image.asset(weatherData!.getImage().toString()),
                  const SizedBox(width: 30,),
                  Text('${weatherData!.avgTemp.toInt()}',style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold
                  ),),
                  const SizedBox(width: 50,),
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                      Text('maxTemp: ${weatherData!.maxTemp.toInt()}',style: const TextStyle
                        (
                        fontSize: 20,

                      ),),
                      Text('minTemp: ${weatherData!.minTemp.toInt()}',style: const TextStyle
                        (
                        fontSize: 20,

                      ),),

                    ],),
                ],
              ),
              const Spacer(),
              Text(weatherData!.weatherStateName,style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold
              ),),
              const Spacer(flex: 4,),



            ],
          ),
        ),
      );
}

