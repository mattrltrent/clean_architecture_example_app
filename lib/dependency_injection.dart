import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'core/network/connection_info.dart';
import 'core/utils/input_validator.dart';
import 'features/weather_data/data/datasources/weather_remote_date_source.dart';
import 'features/weather_data/data/repositories/weather_repository_concrete.dart';
import 'features/weather_data/domain/repositories/weather_repository_interface.dart';
import 'features/weather_data/domain/usecases/get_location_weather.dart';
import 'features/weather_data/domain/usecases/get_random_location_weather.dart';
import 'features/weather_data/presentation/cubit/weather_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  //! Features - Weather Location
  // Bloc (Cubit)
  sl.registerFactory(
    () => WeatherCubit(
      getLocationWeather: sl(),
      getRandomLocationWeather: sl(),
      inputValidator: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetLocationWeather(repository: sl()));
  sl.registerLazySingleton(() => GetRandomLocationWeather(repository: sl()));

  // Repository
  sl.registerLazySingleton(
    () => WeatherRepository(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton(() => WeatherRemoteDataSource(client: sl()));

  //! Core
  sl.registerLazySingleton(() => InputValidator());
  sl.registerLazySingleton(() => NetworkInfo(sl()));

  //! External
  // Something like SharedPreferences would go here too
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
