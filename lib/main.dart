import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weatherapp/api/weatherapi.dart';
import 'package:weatherapp/screens/homePage.dart';

import 'package:weatherapp/screens/navigation.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      // ChangeNotifierProvider<ForecastApi>(
      //   create: (context) => ForecastApi(),
      // ),
      ChangeNotifierProvider<Weatherapi>(
        create: (context) => Weatherapi(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
