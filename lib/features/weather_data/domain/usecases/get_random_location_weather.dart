import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/repositories/weather_repository_concrete.dart';
import '../entities/weather_location.dart';

class GetRandomLocationWeather implements Usecase<WeatherLocation, NoParams> {
  final WeatherRepository repository;

  GetRandomLocationWeather({required this.repository});

  @override
  Future<Either<Failure, WeatherLocation>> call(NoParams params) async {
    return await repository.getRandomLocationWeather();
  }
}
