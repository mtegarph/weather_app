import 'dart:io';

import 'package:dio/dio.dart';
import 'package:weather_app/core/error/failure.dart';
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
      // Melakukan permintaan GET ke API geocoding
      final response = await dio.get(
        'https://geocoding-api.open-meteo.com/v1/search?name=$name&count=1',
      );
      // Mengonversi respons JSON menjadi objek GetCoordinate
      return GetCoordinate.fromJson(response.data);
    } catch (e) {
      // Menangani berbagai jenis error yang mungkin terjadi
      if (e is DioException) {
        switch (e.type) {
          case DioExceptionType.connectionTimeout:
          case DioExceptionType.sendTimeout:
          case DioExceptionType.receiveTimeout:
            // Error terkait timeout koneksi
            throw Exception('Internet connection error: $e');
          case DioExceptionType.badResponse:
            // Error respons dari server
            throw ServerFailure('Server error: ${e.response?.statusCode}');
          case DioExceptionType.unknown:
            // Menangani error socket jika terjadi
            if (e.error is SocketException) {
              throw Exception('Socket error: $e');
            }
          case DioExceptionType.badCertificate:
            // Error sertifikat SSL
            throw Exception('Bad certificate: $e');
          case DioExceptionType.cancel:
            // Permintaan dibatalkan
            throw Exception('Request canceled: $e');
          case DioExceptionType.connectionError:
            // Error koneksi umum
            throw ConnectionFailure('Connection error: $e');
        }
      }
      // Menangani error umum yang tidak termasuk dalam kategori di atas
      throw Exception('Failed to fetch coordinates: $e');
    }
  }
}
