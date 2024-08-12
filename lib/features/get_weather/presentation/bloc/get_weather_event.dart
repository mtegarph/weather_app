part of 'get_weather_bloc.dart';

abstract class GetWeatherEvent extends Equatable {
  const GetWeatherEvent();

  @override
  List<Object> get props => [];
}

class GetCoordinateeEvent extends GetWeatherEvent {
  final ParameterCoordinate parameter;
  const GetCoordinateeEvent({required this.parameter});
}
