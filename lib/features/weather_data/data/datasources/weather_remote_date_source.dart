import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

import '../../../../core/errors/exceptions.dart';
import '../models/weather_model.dart';

const String API_KEY = "49db6b4a1405dedfa53864b0b935039c";

abstract class IWeatherRemoteDataSource {
  Future<WeatherModel> getLocationWeather(String city);
  Future<WeatherModel> getRandomLocationWeather();
}

class WeatherRemoteDataSource implements IWeatherRemoteDataSource {
  final http.Client client;

  WeatherRemoteDataSource({required this.client});

  /// Throws a [ServerException] on all errors.
  @override
  Future<WeatherModel> getLocationWeather(String city) =>
      _getWeatherFromUrl("https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$API_KEY");

  /// Throws a [ServerException] on all errors.
  @override
  Future<WeatherModel> getRandomLocationWeather() => _getWeatherFromUrl(
      "https://api.openweathermap.org/data/2.5/weather?lat=${Random().nextInt(90)}&lon=${Random().nextInt(90)}&appid=$API_KEY");

  Future<WeatherModel> _getWeatherFromUrl(String url) async {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
      },
    );
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
