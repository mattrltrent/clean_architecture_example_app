// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';

// import '../../../../core/utils/input_validator.dart';
// import '../../domain/entities/weather_location.dart';
// import '../../domain/usecases/get_location_weather.dart';
// import '../../domain/usecases/get_random_location_weather.dart';

// part 'weather_event.dart';
// part 'weather_state.dart';

// const String SERVER_FAILURE_MESSAGE = "Server failure.";
// const String CONNECTION_FAILURE_MESSAGE = "Connection failure.";
// const String INVALID_INPUT_FAILURE_MESSAGE = "Invalid input.";

// class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
//   final GetLocationWeather getLocationWeather;
//   final GetRandomLocationWeather getRandomLocationWeather;
//   final InputValidator inputValidator;

//   WeatherBloc({
//     required this.getLocationWeather,
//     required this.getRandomLocationWeather,
//     required this.inputValidator,
//   }) : super(Empty()) {
//     on<WeatherEvent>((event, emit) {
//       if (event is GetWeatherForLocation) {
//         final inputEither = inputValidator.locationValidChecker(event.location);
//         inputEither.fold(
//           (failure) async* {
//             yield const Error(message: INVALID_INPUT_FAILURE_MESSAGE);
//           },
//           (location) async* {
//             yield Loading();
//             final failureOrWeather = await getLocationWeather(Params(location: location));
//             yield failureOrWeather.fold(
//               (failure) => throw UnimplementedError(),
//               (weather) => Loaded(weather: weather),
//             );
//           },
//         );
//       }
//     });
//   }
// }
