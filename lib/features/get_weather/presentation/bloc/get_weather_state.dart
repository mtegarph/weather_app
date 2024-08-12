part of 'get_weather_bloc.dart';

abstract class GetWeatherState extends Equatable {
  const GetWeatherState();  

  @override
  List<Object> get props => [];
}
class GetWeatherInitial extends GetWeatherState {}
