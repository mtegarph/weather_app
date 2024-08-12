import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/core/parameter/parameter.dart';
import 'package:weather_app/features/get_weather/domain/entities/get_coordinates_entity.dart';
import 'package:weather_app/features/get_weather/domain/usecases/get_coordinate_usecase.dart';

part 'get_weather_event.dart';
part 'get_weather_state.dart';

class GetWeatherBloc extends Bloc<GetWeatherEvent, GetWeatherState> {
  final GetCoordinateUsecase getCoordinateUsecase;
  GetWeatherBloc(this.getCoordinateUsecase) : super(GetWeatherInitial()) {
    on<GetCoordinateeEvent>(_getCoordinate);
  }

  Future<void> _getCoordinate(
      GetCoordinateeEvent event, Emitter<GetWeatherState> emit) async {
    print('getCoordinate');
    emit(GetWeatherLoading());
    final result = await getCoordinateUsecase.call(
      params: event.parameter,
    );
    result.fold(
      (failure) => emit(GetWeatherError(message: failure.message)),
      (data) => emit(GetWeatherLoaded(coordinateEntity: data)),
    );
  }
}
