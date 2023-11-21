import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:weatherapp/api/weatherapi.dart';
import 'package:weatherapp/screens/loading.dart';

import 'package:weatherapp/util/switchcase.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<Weatherapi>(context, listen: false).fetchData();
    // Provider.of<ForecastApi>(context, listen: false).fetchforecast();
    // Provider.of<Weatherapi>(context, listen: false).fetchforecast();
    super.initState();
  }

  String formatDateTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    String formattedTime =
        "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
    return formattedTime;
  }

  DateTime? unpackDate(int k) {
    int millis = k * 1000;
    return DateTime.fromMillisecondsSinceEpoch(millis);
  }

  DateTime? sunrise1;
  DateTime? sunset1;
  String? sunrise;
  String? sunset;

  var myText = GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: const Color(0xff1E234D));
  var mynewText =
      GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w400);

  var myColor = const Color.fromARGB(255, 255, 255, 255);

  @override
  Widget build(BuildContext context) {
    // final weatherProvider = Provider.of<Weatherapi>(context, listen: true);
    final scafoldkey = GlobalKey<ScaffoldState>();
    // final forecast = Provider.of<ForecastApi>(context, listen: true);
    return Scaffold(
      key: scafoldkey,
      drawer: const drawer(),
      body: Consumer<Weatherapi>(
        builder: (context, value, child) {
          /// Sunrise

          if (value.weatherData != null) {
            sunrise1 = unpackDate(value.weatherData!.sys.sunrise);
            sunset1 = unpackDate(value.weatherData!.sys.sunset);
            sunrise = formatDateTime(sunrise1.toString());
            sunset = formatDateTime(sunset1.toString());
          }

          ///Sunset
          // final DateTime? sunset1 = unpackDate(value.weatherData!.sys.sunset);
          // final String sunset = formatDateTime(sunset1.toString());
          return value.weatherData == null
              ? Loading()
              : Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: const Color(0xff41C9D7),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                        15, kToolbarHeight * 0.6, 15, 15),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      scafoldkey.currentState!.openDrawer();
                                    },
                                    child: const Icon(
                                      Icons.menu_rounded,
                                      size: 40,
                                      color: Color(0xff1E234D),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on_outlined,
                                        size: 30,
                                        color: Color(0xff1E234D),
                                      ),
                                      Text(
                                        value.weatherData!.name.toString(),
                                        style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xff1E234D)),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 50,
                                  )
                                ]),
                          ),
                          SizedBox(
                            height: 300,
                            width: MediaQuery.of(context).size.height * 0.9,
                            child: Column(children: [
                              getWeatherIcons(value.weatherData!.weather[0].id),
                              Text(
                                value.weatherData!.weather[0].description,
                                style: GoogleFonts.outfit(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "${value.weatherData!.main.temp.toStringAsFixed(0)}°C",
                                style: GoogleFonts.poppins(
                                    fontSize: 50,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Feels Like ${value.weatherData!.main.feelsLike.toString()}°C",
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                width: 10,
                              )
                            ]),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          // day trend ------------------------------------------------------------------------------------
                          Container(
                            height: 210,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    offset: const Offset(0, 0),
                                    blurRadius: 15,
                                    spreadRadius: 1)
                              ],
                              color: const Color.fromARGB(255, 124, 208, 216),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(children: [
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  const Icon(
                                    Icons.cloud_outlined,
                                    size: 28,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text("Day Trend",
                                      style: GoogleFonts.poppins(
                                          color: const Color(0xff1E234D),
                                          fontSize: 23,
                                          fontWeight: FontWeight.w500))
                                ]),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(children: [
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  HomeDetailsWidget(
                                    icon: (Icons.water),
                                    size: 25,
                                    title: "wind",
                                    myColor: myColor,
                                    mynewText: mynewText,
                                    myText: myText,
                                    value: value.weatherData!.wind.speed
                                        .toString(),
                                  ),
                                  const SizedBox(
                                    width: 120,
                                  ),
                                  HomeDetailsWidget(
                                    icon: (Icons.water_drop_outlined),
                                    size: 25,
                                    title: "Humidity",
                                    myColor: myColor,
                                    mynewText: mynewText,
                                    myText: myText,
                                    value: value.weatherData!.main.humidity
                                        .toString(),
                                  ),
                                ]),
                                Row(children: [
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  HomeDetailsWidget(
                                    icon: (Icons.sunny),
                                    size: 25,
                                    title: "Sunrise",
                                    myColor: myColor,
                                    mynewText: mynewText,
                                    myText: myText,
                                    value: "${sunrise ?? "-"}AM",
                                  ),
                                  const SizedBox(
                                    width: 80,
                                  ),
                                  HomeDetailsWidget(
                                    icon: (Icons.sunny_snowing),
                                    size: 25,
                                    title: "Sunset",
                                    myColor: myColor,
                                    mynewText: mynewText,
                                    myText: myText,
                                    value: "${sunset ?? "-"}PM",
                                  ),
                                ]),
                                Row(children: [
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  HomeDetailsWidget(
                                    icon: (Icons.thermostat),
                                    size: 25,
                                    title: "Temp max",
                                    myColor: myColor,
                                    mynewText: mynewText,
                                    myText: myText,
                                    value:
                                        "${value.weatherData!.main.tempMax}°C"
                                            .toString(),
                                  ),
                                  const SizedBox(
                                    width: 83,
                                  ),
                                  HomeDetailsWidget(
                                    icon: (Icons.thermostat),
                                    size: 25,
                                    title: "Temp min",
                                    myColor: myColor,
                                    mynewText: mynewText,
                                    myText: myText,
                                    value:
                                        "${value.weatherData!.main.tempMin}°C"
                                            .toString(),
                                  ),
                                ]),
                              ],
                            ),
                          ),
                          // ///////////////////////////////////////////////////////////////////////////////////////////////////////
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Today",
                                style: GoogleFonts.poppins(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 150,
                            width: double.infinity,
                            child: value.forecastData == null
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 10,
                                    // value.forecastData!.list.length,

                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 100,
                                          height: 90,
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.2),
                                                    offset: const Offset(0, 0),
                                                    blurRadius: 5,
                                                    spreadRadius: 1)
                                              ],
                                              color: const Color.fromARGB(
                                                  255, 137, 215, 223),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                const Text("Time"),
                                                SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.1,
                                                    width: double.infinity,
                                                    child: getWeatherIcons(value
                                                        .weatherData!
                                                        .weather[0]
                                                        .id)),
                                                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////                                   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                                                Text(
                                                  "${value.forecastData!.list[index].main.temp}°C"
                                                      .toString(),
                                                  style: GoogleFonts.poppins(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 13, 48, 78),
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )
                                              ]),
                                        ),
                                      );
                                    },
                                  ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
// drawer////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class drawer extends StatelessWidget {
  const drawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var myDrawerColor = const Color.fromARGB(255, 255, 255, 255);
    var myDrawerText =
        GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500);
    return Drawer(
      backgroundColor: const Color(0xff41C9D7),
      child: Column(
        children: [
          const SizedBox(
            height: 250,
          ),
          Row(
            children: [
              const SizedBox(
                width: 40,
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25)),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(
                    "Anika Tasnim",
                    style: myDrawerText,
                  ),
                  Text(
                    "anikatasnim00@gmail.com",
                    style: GoogleFonts.poppins(),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 40,
              ),
              Icon(
                Icons.search,
                color: myDrawerColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Find City",
                style: myDrawerText,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 40,
              ),
              Icon(
                Icons.location_on_outlined,
                color: myDrawerColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Text("Map", style: myDrawerText),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 40,
              ),
              Icon(
                Icons.settings_outlined,
                color: myDrawerColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Text("Settings", style: myDrawerText),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 40,
              ),
              Icon(
                Icons.list_alt_rounded,
                color: myDrawerColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Text("Weather Newa", style: myDrawerText),
            ],
          ),
          // const SizedBox(
          //   width: 20,
          // ),
        ],
      ),
    );
  }
}

class HomeDetailsWidget extends StatelessWidget {
  const HomeDetailsWidget({
    super.key,
    required this.myColor,
    required this.mynewText,
    required this.myText,
    required this.value,
    required this.title,
    required this.icon,
    required this.size,
  });

  final Color myColor;
  final TextStyle mynewText;
  final TextStyle myText;
  final String value;
  final String title;
  final IconData icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: size,
          color: myColor,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: mynewText,
            ),
            Text(
              value,
              style: myText,
            ),
          ],
        ),
      ],
    );
  }
}
