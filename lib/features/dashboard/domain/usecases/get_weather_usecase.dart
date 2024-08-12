import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/core/parameter/parameter.dart';
import 'package:weather_app/core/usecase/usecase.dart';
import 'package:weather_app/features/dashboard/domain/entities/weather_entity.dart';
import 'package:weather_app/features/dashboard/domain/repositories/weather_repository.dart';

class GetWeatherUseCase
    implements UseCase<Either<Failure, GetWeatherEntity>, ParameterWeather> {
  final WeatherRepository repository;
  GetWeatherUseCase({required this.repository});
  @override
  Future<Either<Failure, GetWeatherEntity>> call(
      {ParameterWeather? params}) async {
    return await repository.getWeather(params!);
  }
}
