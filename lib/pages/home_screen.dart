import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/weather_screen.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

class HomePage extends StatelessWidget {
  String? cityName;
  var searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
          backgroundColor: Colors.blue[300],
          title: const Text('Weather App'),
        ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image(image: AssetImage('assets/images/aa.jpg'),height:900,fit: BoxFit.cover,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: Container(
                      width: 300,
                      height: 300,
                      child: const FlareActor(
                        'assets/images/WorldSpin.flr',
                        fit: BoxFit.contain,
                        animation: 'roll',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      cityName = value;
                    },
                    onSubmitted: (value) async {
                      cityName = value;
                      WeatherService service = WeatherService();
                      WeatherModel? weather =
                      await service.getWeather(cityName: cityName!);
                      // ignore: use_build_context_synchronously
                      Provider.of<WeatherProvider>(context, listen: false)
                          .cityName = cityName;
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WeatherScreen()),
                      );
                      // ignore: use_build_context_synchronously
                      Provider.of<WeatherProvider>(context, listen: false).weatherData = weather;
                     searchController.clear();
                    },
                    decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () async {
                            WeatherService service = WeatherService();
                            WeatherModel? weather =
                                await service.getWeather(cityName: cityName!);
                            // ignore: use_build_context_synchronously
                            Provider.of<WeatherProvider>(context, listen: false)
                                .cityName = cityName;
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WeatherScreen()),
                            );
                            // ignore: use_build_context_synchronously
                            Provider.of<WeatherProvider>(context, listen: false).weatherData = weather;
                            searchController.clear();
                          },
                          child: const Icon(Icons.search),
                        ),
                        label: Text(
                          'Search',
                        ),
                        hintText: 'enter a city',
                        hintStyle: TextStyle(color: Colors.white.withOpacity(.6)),
                        border: const OutlineInputBorder()
                        // border: BorderRadius.circular(15)
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15)
                    ),
                      width: double.infinity,

                      child: TextButton(onPressed: ()async{
                        WeatherService service = WeatherService();
                        WeatherModel? weather =
                            await service.getWeather(cityName: cityName!);
                        // ignore: use_build_context_synchronously
                        Provider.of<WeatherProvider>(context, listen: false)
                            .cityName = cityName;
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WeatherScreen()),
                        );
                        // ignore: use_build_context_synchronously
                        Provider.of<WeatherProvider>(context, listen: false).weatherData = weather;
                        searchController.clear();
                      }, child: const Text('Search',style: TextStyle(color: Colors.white,fontSize: 20),))),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
