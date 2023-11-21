// import 'dart:convert';

// import 'package:flutter/foundation.dart';
// import 'package:weatherapp/model/forecastmodel.dart';
// import 'package:weatherapp/util/geolocator.dart';

// import 'package:http/http.dart' as http;

// class ForecastApi with ChangeNotifier {
//   final locData = LocationData();
//   ForecastWeatherModel? _forecastData;
//   ForecastWeatherModel? get forecastData => _forecastData;

//   Future<void> fetchforecast() async {
//     await locData.determinePosition();
//     String lat = locData.latitude!;
//     String lon = locData.longitude!;

//     String baseurl =
//         "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=b82873568609973110e062731c792e21&units=metric";
//     var response = await http.get(Uri.parse(baseurl));
//     if (kDebugMode) {
    
//     }
//     try {
//       if (response.statusCode == 200) {
//         _forecastData = ForecastWeatherModel.fromJson(json.decode(response.body));
//           if (kDebugMode) {
//             print(response.body);
//           }
//         notifyListeners();
//       } else {
//         if (kDebugMode) {
//           print("error");
//         }
//       }
//     } on Exception catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//   }
// }
