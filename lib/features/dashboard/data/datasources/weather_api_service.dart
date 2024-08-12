import 'dart:io';

import 'package:dio/dio.dart';
import 'package:weather_app/core/error/failure.dart';
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
      // Melakukan permintaan GET ke API cuaca
      final response = await dio.get(
        'https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&current_weather=true',
      );

      // Mencetak data respons untuk keperluan debugging
      print(response.data);

      // Mengonversi data JSON menjadi objek GetWeatherModel
      return GetWeatherModel.fromJson(response.data);
    } catch (e) {
      // Menangani berbagai jenis error yang mungkin terjadi
      if (e is DioException) {
        switch (e.type) {
          case DioExceptionType.connectionTimeout:
          case DioExceptionType.sendTimeout:
          case DioExceptionType.receiveTimeout:
            // Error terkait koneksi internet
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
