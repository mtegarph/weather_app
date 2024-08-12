part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class GetWeatherEvent extends DashboardEvent {
  final ParameterWeather parameter;
  const GetWeatherEvent({required this.parameter});
}
