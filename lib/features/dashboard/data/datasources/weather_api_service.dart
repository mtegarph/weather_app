import 'dart:io';

import 'package:dio/dio.dart';
import 'package:weather_app/features/dashboard/data/models/weather_model.dart';

abstract class WeatherApiService {
  Future<GetWeatherModel> getWeather(String latitude, String longitude);
}

class WeatherApiServiceImpl implements WeatherApiService {
  final Dio dio;

  WeatherApiServiceImpl({required this.dio});
  @override
  Future<GetWeatherModel> getWeather(String latitude, String longitude) async {
    try {
      final response = await dio.get(
        'https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&current_weather=true',
      );
      return GetWeatherModel.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        switch (e.type) {
          case DioExceptionType.connectionTimeout:
          case DioExceptionType.sendTimeout:
          case DioExceptionType.receiveTimeout:
            throw Exception('Internet connection error: $e');
          case DioExceptionType.badResponse:
            throw Exception('Server error: ${e.response?.statusCode}');
          case DioExceptionType.unknown:
            if (e.error is SocketException) {
              throw Exception('Socket error: $e');
            }
          case DioExceptionType.badCertificate:
            throw Exception('Bad certificate: $e');
          case DioExceptionType.cancel:
            throw Exception('Request canceled: $e');
          case DioExceptionType.connectionError:
            throw Exception('Connection error: $e');
        }
      }
      throw Exception('Failed to fetch coordinates: $e');
    }
  }
}
