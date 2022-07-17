import 'package:flutter/material.dart';

import '../../features/weather_data/presentation/screens/weather_detail.dart';
import '../../features/weather_data/presentation/screens/weather_result.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const WeatherResultScreen());
      case "/weather_detail":
        return MaterialPageRoute(builder: (_) => const WeatherDetailScreen());
      default:
        throw Exception("Named route not defined");
    }
  }
}
