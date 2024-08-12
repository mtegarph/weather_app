import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/exception.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/core/parameter/parameter.dart';
import 'package:weather_app/features/dashboard/data/datasources/weather_api_service.dart';
import 'package:weather_app/features/dashboard/domain/entities/weather_entity.dart';
import 'package:weather_app/features/dashboard/domain/repositories/weather_repository.dart';

class WeatherRepoImpl implements WeatherRepository {
  final WeatherApiService apiService;

  WeatherRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, GetWeatherEntity>> getWeather(
      ParameterWeather parameter) async {
    try {
      final result = await apiService.getWeather(
        parameter.latitude.toString(),
        parameter.longitude.toString(),
      );
      final data = GetWeatherEntity(
        currentWeather: CurrentWeather(
          interval: result.currentWeather?.interval,
          isDay: result.currentWeather?.isDay,
          temperature: result.currentWeather?.temperature,
          weathercode: result.currentWeather?.weathercode,
          winddirection: result.currentWeather?.winddirection,
          windspeed: result.currentWeather?.windspeed,
          time: result.currentWeather?.time,
        ),
        currentWeatherUnits: CurrentWeatherUnits(
          temperature: result.currentWeatherUnits?.temperature,
          windspeed: result.currentWeatherUnits?.windspeed,
          weathercode: result.currentWeatherUnits?.weathercode,
          winddirection: result.currentWeatherUnits?.winddirection,
          time: result.currentWeatherUnits?.time,
        ),
        elevation: result.elevation,
        generationtimeMs: result.generationtimeMs,
        latitude: result.latitude,
        longitude: result.longitude,
        timezone: result.timezone,
        timezoneAbbreviation: result.timezoneAbbreviation,
        utcOffsetSeconds: result.utcOffsetSeconds,
      );
      return Right(data);
    } catch (e) {
      if (e is SocketException) {
        return const Left(ConnectionFailure('No internet connection'));
      } else if (e is ServerException) {
        return const Left(ServerFailure('Server error occurred'));
      } else {
        return Left(ConnectionFailure('An unexpected error occurred: $e'));
      }
    }
  }
}
