import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/parameter/parameter.dart';
import 'package:weather_app/features/get_weather/presentation/bloc/get_weather_bloc.dart';

class GetCoordinatesPage extends StatelessWidget {
  const GetCoordinatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cari Kota'),
      ),
      body: BlocConsumer<GetWeatherBloc, GetWeatherState>(
        listener: (context, state) {
          if (state is GetWeatherLoaded) {
            Navigator.pop(context, state.coordinateEntity);
          } else if (state is GetWeatherError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      hintText: 'Masukkan nama kota',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (value) {
                      context.read<GetWeatherBloc>().add(GetCoordinateeEvent(
                          parameter: ParameterCoordinate(name: value)));
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    // Implement search functionality here
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
