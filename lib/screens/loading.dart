import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherapp/util/geolocator.dart';

class Loading extends StatefulWidget {
  Loading({super.key});
  final location = LocationData();
  @override
  State<Loading> createState() => _LoadingState();
  Future<void> fetchData() async {
    await location.determinePosition();
  }

  Future<void> fetchforecast() async {
    await location.determinePosition();
  }
}

final locDatat = LocationData();

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff41C9D7),
      ),
      backgroundColor:const  Color(0xff41C9D7),
      body: SizedBox(
        height: 600,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Lottie.asset("assets/cloud.json"),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                "Just a second..",
                style: GoogleFonts.poppins(
                    fontSize: 25, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
