import 'dart:io';

import 'package:dio/dio.dart';
import 'package:weather_app/features/get_weather/data/models/coordinate_model.dart';

abstract class GetCoordinatesApiService {
  Future<GetCoordinate> getCoordinates(String name);
}

class GetcoorinatesApiServiceImpl implements GetCoordinatesApiService {
  final Dio dio;
  GetcoorinatesApiServiceImpl({required this.dio});
  @override
  Future<GetCoordinate> getCoordinates(String name) async {
    try {
      final response = await dio.get(
        'https://geocoding-api.open-meteo.com/v1/search?name=$name&count=1',
      );
      return GetCoordinate.fromJson(response.data);
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
