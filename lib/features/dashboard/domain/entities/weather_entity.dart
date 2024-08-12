class GetWeatherEntity {
  final double? latitude;
  final double? longitude;
  final double? generationtimeMs;
  final int? utcOffsetSeconds;
  final String? timezone;
  final String? timezoneAbbreviation;
  final double? elevation;
  final CurrentWeatherUnits? currentWeatherUnits;
  final CurrentWeather? currentWeather;

  GetWeatherEntity({
    this.latitude,
    this.longitude,
    this.generationtimeMs,
    this.utcOffsetSeconds,
    this.timezone,
    this.timezoneAbbreviation,
    this.elevation,
    this.currentWeatherUnits,
    this.currentWeather,
  });

  GetWeatherEntity copyWith({
    double? latitude,
    double? longitude,
    double? generationtimeMs,
    int? utcOffsetSeconds,
    String? timezone,
    String? timezoneAbbreviation,
    double? elevation,
    CurrentWeatherUnits? currentWeatherUnits,
    CurrentWeather? currentWeather,
  }) =>
      GetWeatherEntity(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        generationtimeMs: generationtimeMs ?? this.generationtimeMs,
        utcOffsetSeconds: utcOffsetSeconds ?? this.utcOffsetSeconds,
        timezone: timezone ?? this.timezone,
        timezoneAbbreviation: timezoneAbbreviation ?? this.timezoneAbbreviation,
        elevation: elevation ?? this.elevation,
        currentWeatherUnits: currentWeatherUnits ?? this.currentWeatherUnits,
        currentWeather: currentWeather ?? this.currentWeather,
      );
}

class CurrentWeather {
  final String? time;
  final int? interval;
  final double? temperature;
  final double? windspeed;
  final int? winddirection;
  final int? isDay;
  final int? weathercode;

  CurrentWeather({
    this.time,
    this.interval,
    this.temperature,
    this.windspeed,
    this.winddirection,
    this.isDay,
    this.weathercode,
  });

  CurrentWeather copyWith({
    String? time,
    int? interval,
    double? temperature,
    double? windspeed,
    int? winddirection,
    int? isDay,
    int? weathercode,
  }) =>
      CurrentWeather(
        time: time ?? this.time,
        interval: interval ?? this.interval,
        temperature: temperature ?? this.temperature,
        windspeed: windspeed ?? this.windspeed,
        winddirection: winddirection ?? this.winddirection,
        isDay: isDay ?? this.isDay,
        weathercode: weathercode ?? this.weathercode,
      );
}

class CurrentWeatherUnits {
  final String? time;
  final String? interval;
  final String? temperature;
  final String? windspeed;
  final String? winddirection;
  final String? isDay;
  final String? weathercode;

  CurrentWeatherUnits({
    this.time,
    this.interval,
    this.temperature,
    this.windspeed,
    this.winddirection,
    this.isDay,
    this.weathercode,
  });

  CurrentWeatherUnits copyWith({
    String? time,
    String? interval,
    String? temperature,
    String? windspeed,
    String? winddirection,
    String? isDay,
    String? weathercode,
  }) =>
      CurrentWeatherUnits(
        time: time ?? this.time,
        interval: interval ?? this.interval,
        temperature: temperature ?? this.temperature,
        windspeed: windspeed ?? this.windspeed,
        winddirection: winddirection ?? this.winddirection,
        isDay: isDay ?? this.isDay,
        weathercode: weathercode ?? this.weathercode,
      );
}
