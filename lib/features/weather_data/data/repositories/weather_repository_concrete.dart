import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/connection_info.dart';
import '../../domain/entities/weather_location.dart';
import '../../domain/repositories/weather_repository_interface.dart';
import '../datasources/weather_remote_date_source.dart';

class WeatherRepository implements IWeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  WeatherRepository({required this.remoteDataSource, required this.networkInfo});

  Future<Either<Failure, WeatherLocation>> _getWeather(
      Future<WeatherLocation> remoteDataSource) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource);
      } on ServerException {
        return Left(ServerFailure());
      } on TimeoutException {
        return Left(ConnectionFailure());
      } on SocketException {
        return Left(ConnectionFailure());
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, WeatherLocation>> getLocationWeather(String location) async =>
      await _getWeather(remoteDataSource.getLocationWeather(location));

  @override
  Future<Either<Failure, WeatherLocation>> getRandomLocationWeather() async =>
      await _getWeather(remoteDataSource.getRandomLocationWeather());
}
