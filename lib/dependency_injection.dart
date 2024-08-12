import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/features/dashboard/data/datasources/weather_api_service.dart';
import 'package:weather_app/features/dashboard/data/repositories/weather_repo_impl.dart';
import 'package:weather_app/features/dashboard/domain/repositories/weather_repository.dart';
import 'package:weather_app/features/dashboard/domain/usecases/get_weather_usecase.dart';
import 'package:weather_app/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:weather_app/features/get_weather/data/datasources/get_coordinates_api_service.dart';
import 'package:weather_app/features/get_weather/data/repositories/get_coordinates_repo_impl.dart';
import 'package:weather_app/features/get_weather/domain/repositories/get_weather_repo.dart';
import 'package:weather_app/features/get_weather/domain/usecases/get_coordinate_usecase.dart';
import 'package:weather_app/features/get_weather/presentation/bloc/get_weather_bloc.dart';

final sl = GetIt.instance;

Future<void> initialize() async {
  sl.registerSingleton<Dio>(Dio());

  // data source
  sl.registerLazySingleton<WeatherApiService>(
      () => WeatherApiServiceImpl(dio: sl()));
  sl.registerLazySingleton<GetCoordinatesApiService>(
    () => GetcoorinatesApiServiceImpl(dio: sl()),
  );
  // repository
  sl.registerLazySingleton<GetWeatherRepo>(
    () => GetWeatherRepoImpl(apiService: sl()),
  );
  sl.registerLazySingleton<WeatherRepository>(() => WeatherRepoImpl(
        apiService: sl(),
      ));
  // usecase
  sl.registerLazySingleton(() => GetCoordinateUsecase(repo: sl()));
  sl.registerLazySingleton(() => GetWeatherUseCase(repository: sl()));
  // bloc
  sl.registerFactory<GetWeatherBloc>(() => GetWeatherBloc(sl()));
  sl.registerFactory<DashboardBloc>(() => DashboardBloc(sl()));
}
