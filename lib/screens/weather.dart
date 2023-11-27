import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/api/weatherapi.dart';

import 'package:weatherapp/constanst/colors.dart';
import 'package:weatherapp/util/switchcase.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  void initState() {
    Provider.of<Weatherapi>(context, listen: false).fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final forecast = Provider.of<Weatherapi>(context, listen: true);
    return Scaffold(
      backgroundColor: const Color(0xff41C9D7),
      appBar: AppBar(
          backgroundColor: const Color(0xff41C9D7),
          title: Text(
            "Weather",
            style: myText,
          )),
      body: Column(children: [
        SizedBox(
          height: 120,
          width: double.infinity,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 90,
                    height: 100,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 50, 21, 101),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(children: [
                      Text(
                        "${forecast.forecastData!.list[index].main.temp.toString()}°C",
                        style: const TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                          height: 65,
                          width: 65,
                          child: getWeatherIcons(
                              forecast.weatherData!.weather[0].id))
                    ]),
                  ),
                );
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.amber,
            height: MediaQuery.of(context).size.height * .35,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .3,
          child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 147, 212, 219),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                );
              }),
        )
      ]),
    );
  }
}
