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
      // Memanggil API service untuk mendapatkan data cuaca
      final result = await apiService.getWeather(
        parameter.latitude.toString(),
        parameter.longitude.toString(),
      );

      // Memetakan hasil API ke GetWeatherEntity
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

      // Mengembalikan hasil sukses yang dibungkus dalam Right
      return Right(data);
    } catch (e) {
      // Menangani berbagai jenis error
      if (e is ConnectionFailure) {
        // Mengembalikan Left dengan ConnectionFailure untuk masalah jaringan
        return const Left(ConnectionFailure(
            'Terjadi Kesalahan, Pastikan anda terhubung ke internet'));
      } else if (e is ServerException) {
        // Mengembalikan Left dengan ServerFailure untuk error server
        return const Left(ServerFailure('Server error occurred'));
      } else {
        // Mengembalikan Left dengan ConnectionFailure untuk error tidak terduga
        return Left(ConnectionFailure('An unexpected error occurred: $e'));
      }
    }
  }
}
