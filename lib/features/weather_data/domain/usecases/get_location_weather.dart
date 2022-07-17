import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/repositories/weather_repository_concrete.dart';
import '../entities/weather_location.dart';

class GetLocationWeather implements Usecase<WeatherLocation, Params> {
  final WeatherRepository repository;

  GetLocationWeather({required this.repository});

  @override
  Future<Either<Failure, WeatherLocation>> call(Params params) async {
    return await repository.getLocationWeather(params.location);
  }
}

class Params extends Equatable {
  final String location;

  const Params({required this.location});

  @override
  List<Object?> get props => [location];
}
