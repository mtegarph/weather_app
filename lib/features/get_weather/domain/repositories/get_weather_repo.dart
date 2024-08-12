import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/core/parameter/parameter.dart';
import 'package:weather_app/features/get_weather/domain/entities/get_coordinates_entity.dart';

abstract class GetWeatherRepo {
  Future<Either<Failure, CoordinateEntity>> getCoordinates(
      ParameterCoordinate parameter);
}
