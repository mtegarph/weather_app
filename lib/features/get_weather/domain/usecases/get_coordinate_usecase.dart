import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/core/parameter/parameter.dart';
import 'package:weather_app/core/usecase/usecase.dart';
import 'package:weather_app/features/get_weather/domain/entities/get_coordinates_entity.dart';
import 'package:weather_app/features/get_weather/domain/repositories/get_weather_repo.dart';

class GetCoordinateUsecase
    implements UseCase<Either<Failure, CoordinateEntity>, ParameterCoordinate> {
  final GetWeatherRepo repo;

  GetCoordinateUsecase({required this.repo});

  @override
  Future<Either<Failure, CoordinateEntity>> call({params}) {
    return repo.getCoordinates(params ?? const ParameterCoordinate());
  }
}
