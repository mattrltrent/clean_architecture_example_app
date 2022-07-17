import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/weather_location.dart';

abstract class IWeatherRepository {
  Future<Either<Failure, WeatherLocation>> getLocationWeather(String city);
  Future<Either<Failure, WeatherLocation>> getRandomLocationWeather();
}
