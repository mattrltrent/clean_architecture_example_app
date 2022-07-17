import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/input_validator.dart';
import '../../domain/entities/weather_location.dart';
import '../../domain/usecases/get_location_weather.dart';
import '../../domain/usecases/get_random_location_weather.dart';

part 'weather_state.dart';

const String SERVER_FAILURE_MESSAGE = "Server failure.";
const String CONNECTION_FAILURE_MESSAGE = "Connection failure.";
const String INVALID_INPUT_FAILURE_MESSAGE = "Invalid input.";

class WeatherCubit extends Cubit<WeatherState> {
  final GetLocationWeather getLocationWeather;
  final GetRandomLocationWeather getRandomLocationWeather;
  final InputValidator inputValidator;

  WeatherCubit({
    required this.getLocationWeather,
    required this.getRandomLocationWeather,
    required this.inputValidator,
  }) : super(Empty());

  Future<void> getWeatherForLocation(String location) async {
    final inputEither = inputValidator.locationValidChecker(location);
    inputEither.fold(
      (failure) {
        emit(const Error(message: INVALID_INPUT_FAILURE_MESSAGE));
      },
      (location) async {
        emit(Loading());
        final failureOrWeather = await getLocationWeather(Params(location: location));
        failureOrWeather.fold(
          (failure) {
            emit(Error(message: _mapFailureToMessage(failure)));
          },
          (weather) {
            emit(Loaded(weather: weather));
          },
        );
      },
    );
  }

  Future<void> getWeatherForRandomLocation() async {
    emit(Loading());
    final failureOrWeather = await getRandomLocationWeather(NoParams());
    failureOrWeather.fold(
      (failure) {
        emit(Error(message: _mapFailureToMessage(failure)));
      },
      (weather) {
        emit(Loaded(weather: weather));
      },
    );
  }

  // Helper methods

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case ConnectionFailure:
        return CONNECTION_FAILURE_MESSAGE;
      default:
        return "Unexpected error.";
    }
  }
}
