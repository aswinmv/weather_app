import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:weatherapp/model/forecastmodel.dart';
import 'package:weatherapp/util/geolocator.dart';

import 'package:weatherapp/model/weathermodel.dart';
import 'package:http/http.dart' as http;

class Weatherapi with ChangeNotifier {
  final locData = LocationData();
  WeatherModel? _weatherData;
  WeatherModel? get weatherData => _weatherData;
  ForecastWeatherModel? _forecastData;
  ForecastWeatherModel? get forecastData => _forecastData;

  Future<void> fetchData() async {
    await locData.determinePosition();

    String lat = locData.latitude!;
    String lon = locData.longitude!;

    String baseurl =
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=b82873568609973110e062731c792e21&units=metric";
    var response = await http.get(Uri.parse(baseurl));
    if (kDebugMode) {
      // print("--------------------${response.body}");
    }
    try {
      if (response.statusCode == 200) {
        _weatherData = weatherModelFromJson(response.body);
        fetchforecast();
        notifyListeners();
      } else {
        if (kDebugMode) {
          print("error");
        }
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> fetchforecast() async {
    String lat = locData.latitude!;
    String lon = locData.longitude!;

    String baseurl =
        "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=b82873568609973110e062731c792e21&units=metric";
    var response = await http.get(Uri.parse(baseurl));
    if (kDebugMode) {}
    try {
      if (response.statusCode == 200) {
        _forecastData =
            ForecastWeatherModel.fromJson(json.decode(response.body));
        notifyListeners();
        if (kDebugMode) {
          print(response.body);
        }
      } else {
        if (kDebugMode) {
          print("error");
        }
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
