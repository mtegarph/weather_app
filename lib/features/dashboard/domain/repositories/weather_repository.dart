import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/core/parameter/parameter.dart';
import 'package:weather_app/features/dashboard/domain/entities/weather_entity.dart';

abstract class WeatherRepository {
  Future<Either<Failure, GetWeatherEntity>> getWeather(
      ParameterWeather parameter);
}
