import 'package:flutter/material.dart';
import 'package:flutter_weather_app/presentation/screens/home_screen.dart';

/// [AppRouter] is the router class for the application.
class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
