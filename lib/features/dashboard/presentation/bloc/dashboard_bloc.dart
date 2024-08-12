import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/core/parameter/parameter.dart';
import 'package:weather_app/features/dashboard/domain/entities/weather_entity.dart';
import 'package:weather_app/features/dashboard/domain/usecases/get_weather_usecase.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetWeatherUseCase getWeatherUseCase;

  DashboardBloc(this.getWeatherUseCase) : super(DashboardInitial()) {
    on<GetWeatherEvent>(_onGetWeatherEvent);
  }

  void _onGetWeatherEvent(
      GetWeatherEvent event, Emitter<DashboardState> emit) async {
    emit(DashboardLoading());
    final result = await getWeatherUseCase.call(params: event.parameter);

    result.fold(
      (failure) => emit(DashboardError(message: failure.message)),
      (weather) =>
          emit(DashboardLoaded(weather: weather, cityName: event.cityName)),
    );
  }
}
