import 'package:flutter/material.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({required this.location, required this.temperature, Key? key})
      : super(key: key);

  final int temperature;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Text(
        "Location: $location (possibly non existent location), Temperature: ${temperature.toString()} in Kalvin");
  }
}
