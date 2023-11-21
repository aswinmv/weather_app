import 'package:flutter/material.dart';

Widget getWeatherIcons(int conditionCode) {
  String imagePath;

  switch (conditionCode) {
    // thunderstorm///////////////////////////////
    case 200:
    case 201:
    case 202:
    case 210:
    case 211:
    case 212:
      imagePath = "assets/1.png";
      break;
    // rain///////////////////////////////////////
    case 500:
    case 501:
      imagePath = "assets/2.png";
      break;
    case 502:
    case 503:
    case 504:
    case 511:
    case 520:
    case 521:
    case 522:
    case 531:
      imagePath = "assets/3.png";
      break;
    // snow//////////////////////////////
    case 600:
    case 601:
    case 602:
    case 611:
    case 612:
    case 613:
      imagePath = "assets/4.png";
      break;
    // atmosphere///////////////////////////////////////
    case 701:
    case 711:
    case 721:
    case 731:
      imagePath = "assets/5.png";
      break;
    case 741:
    case 751:
    case 761:
    case 762:
    case 771:
    case 781:
      imagePath = "assets/9.png";
      // clear sky////////////////////
      break;
    case 800:
      imagePath = "assets/6.png";
      break;
    // clouds//////////////////////////////////
    case 801:
    case 802:
      imagePath = "assets/7.png";
      break;
    case 803:
    case 804:
      imagePath = "assets/8.png";
      break;
    default:
      imagePath = "assets/sunny.png";
      break;
  }

  return Image.asset(
    imagePath,
    height: 150,
  );
}
