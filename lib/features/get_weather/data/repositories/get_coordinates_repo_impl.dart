import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/exception.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/core/parameter/parameter.dart';
import 'package:weather_app/features/get_weather/data/datasources/get_coordinates_api_service.dart';
import 'package:weather_app/features/get_weather/domain/entities/get_coordinates_entity.dart';
import 'package:weather_app/features/get_weather/domain/repositories/get_weather_repo.dart';

class GetWeatherRepoImpl extends GetWeatherRepo {
  final GetCoordinatesApiService apiService;
  GetWeatherRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, CoordinateEntity>> getCoordinates(
      ParameterCoordinate parameter) async {
    try {
      // Memanggil API service untuk mendapatkan koordinat

      final result = await apiService.getCoordinates(parameter.name.toString());
      // Memetakan hasil API ke CoordinateEntity

      final data = CoordinateEntity(
        admin1: result.results?[0].admin1,
        admin1Id: result.results?[0].admin1Id,
        country: result.results?[0].country,
        countryCode: result.results?[0].countryCode,
        elevation: result.results?[0].elevation,
        featureCode: result.results?[0].featureCode,
        id: result.results?[0].id,
        latitude: result.results?[0].latitude,
        longitude: result.results?[0].longitude,
        name: result.results?[0].name,
        population: result.results?[0].population,
        timezone: result.results?[0].timezone,
        countryId: result.results?[0].countryId,
      );
      return Right(data);
    } catch (e) {
      // Menangani berbagai jenis error
      if (e is ConnectionFailure) {
        return const Left(ConnectionFailure(
            'Terjadi Kesalahan, Pastikan anda terhubung ke internet'));
      } else if (e is ServerException) {
        return const Left(ServerFailure('Server error occurred'));
      } else {
        return Left(ConnectionFailure('An unexpected error occurred: $e'));
      }
    }
  }
}
