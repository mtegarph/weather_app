part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final GetWeatherEntity weather;
  final String cityName;
  const DashboardLoaded({required this.weather, required this.cityName});
}

class DashboardError extends DashboardState {
  final String message;

  const DashboardError({required this.message});
}
