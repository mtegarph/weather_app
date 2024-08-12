import 'package:flutter/material.dart';

const getWeatherUrl =
    'https://api.open-meteo.com/v1/forecast?latitude=-6.21462&longitude=106.84513&current_weather=true';
const getCityCoordinateUrl =
    'https://geocoding-api.open-meteo.com/v1/search?name=jakarta&count=1';

const errorIcon = '🙈';
const emptyIcon = '🏙️';
const loadingIcon = '⛅';
const sunnyIcon = '☀️';
const cloudyIcon = '☁️';
const rainIcon = '🌧️';
const snowIcon = '🌨️';
const unknowIcon = '❓';

//extension to create background gradient
extension on Color {
  Color brighten([int percent = 10]) {
    assert(
      1 <= percent && percent <= 100,
      'percentage must be between 1 and 100',
    );
    final p = percent / 100;
    return Color.fromARGB(
      alpha,
      red + ((255 - red) * p).round(),
      green + ((255 - green) * p).round(),
      blue + ((255 - blue) * p).round(),
    );
  }
}

//widget to create backround
class WeatherBackground extends StatelessWidget {
  const WeatherBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primaryContainer;
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.25, 0.75, 0.90, 1.0],
            colors: [
              color,
              color.brighten(),
              color.brighten(33),
              color.brighten(50),
            ],
          ),
        ),
      ),
    );
  }
}

//extension to convert weather code to icon
extension on int {
  String get toEmoji {
    switch (this) {
      case 0:
        return '☀️';
      case 1:
      case 2:
      case 3:
      case 45:
      case 48:
        return '☁️';
      case 51:
      case 53:
      case 55:
      case 56:
      case 57:
      case 61:
      case 63:
      case 65:
      case 66:
      case 67:
      case 80:
      case 81:
      case 82:
      case 95:
      case 96:
      case 99:
        return '🌧️';
      case 71:
      case 73:
      case 75:
      case 77:
      case 85:
      case 86:
        return '🌨️';
      default:
        return '❓';
    }
  }
}

//extension to convert weather code to background color
extension on int {
  Color get toColor {
    switch (this) {
      case 0:
        return Colors.yellow;
      case 1:
      case 2:
      case 3:
      case 45:
      case 48:
        return Colors.blueGrey;
      case 71:
      case 73:
      case 75:
      case 77:
      case 85:
      case 86:
        return Colors.lightBlueAccent;
      case 51:
      case 53:
      case 55:
      case 56:
      case 57:
      case 61:
      case 63:
      case 65:
      case 66:
      case 67:
      case 80:
      case 81:
      case 82:
      case 95:
      case 96:
      case 99:
        return Colors.indigoAccent;
      default:
        return Colors.cyan;
    }
  }
}
