part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class GetWeatherEvent extends DashboardEvent {
  final ParameterWeather parameter;
  final String cityName;
  const GetWeatherEvent({required this.parameter, required this.cityName});
}
