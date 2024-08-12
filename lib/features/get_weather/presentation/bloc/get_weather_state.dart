part of 'get_weather_bloc.dart';

abstract class GetWeatherState extends Equatable {
  const GetWeatherState();

  @override
  List<Object> get props => [];
}

class GetWeatherInitial extends GetWeatherState {}

class GetWeatherLoading extends GetWeatherState {}

class GetWeatherLoaded extends GetWeatherState {
  final CoordinateEntity coordinateEntity;
  const GetWeatherLoaded({required this.coordinateEntity});
}

class GetWeatherError extends GetWeatherState {
  final String message;
  const GetWeatherError({required this.message});
}
