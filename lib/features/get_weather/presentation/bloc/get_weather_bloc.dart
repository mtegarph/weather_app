import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_weather_event.dart';
part 'get_weather_state.dart';

class GetWeatherBloc extends Bloc<GetWeatherEvent, GetWeatherState> {
  GetWeatherBloc() : super(GetWeatherInitial()) {
    on<GetWeatherEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
