import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:weatherapp/screens/detail.dart';
import 'package:weatherapp/screens/homePage.dart';
import 'package:weatherapp/screens/weather.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

PersistentTabController controller = PersistentTabController(initialIndex: 0);

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      backgroundColor: const Color(0xff2E4C70),
      context,
      controller: controller,
      navBarStyle: NavBarStyle.style12,
      screens: const [HomePage(), WeatherPage(), Details()],
      items: [
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.home),
            activeColorPrimary: Colors.black,
            inactiveColorPrimary: Colors.white),
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.location_on_outlined),
            activeColorPrimary: Colors.black,
            inactiveColorPrimary: Colors.white),
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.list_sharp),
            activeColorPrimary: Colors.black,
            inactiveColorPrimary: Colors.white),
      ],
    );
  }
}
