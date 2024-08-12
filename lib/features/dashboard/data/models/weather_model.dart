class GetWeatherModel {
  final double? latitude;
  final double? longitude;
  final double? generationtimeMs;
  final int? utcOffsetSeconds;
  final String? timezone;
  final String? timezoneAbbreviation;
  final int? elevation;
  final CurrentWeatherUnits? currentWeatherUnits;
  final CurrentWeather? currentWeather;

  GetWeatherModel({
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

  GetWeatherModel copyWith({
    double? latitude,
    double? longitude,
    double? generationtimeMs,
    int? utcOffsetSeconds,
    String? timezone,
    String? timezoneAbbreviation,
    int? elevation,
    CurrentWeatherUnits? currentWeatherUnits,
    CurrentWeather? currentWeather,
  }) =>
      GetWeatherModel(
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

  factory GetWeatherModel.fromJson(Map<String, dynamic> json) =>
      GetWeatherModel(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        generationtimeMs: json["generationtime_ms"]?.toDouble(),
        utcOffsetSeconds: json["utc_offset_seconds"],
        timezone: json["timezone"],
        timezoneAbbreviation: json["timezone_abbreviation"],
        elevation: json["elevation"],
        currentWeatherUnits: json["current_weather_units"] == null
            ? null
            : CurrentWeatherUnits.fromJson(json["current_weather_units"]),
        currentWeather: json["current_weather"] == null
            ? null
            : CurrentWeather.fromJson(json["current_weather"]),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "generationtime_ms": generationtimeMs,
        "utc_offset_seconds": utcOffsetSeconds,
        "timezone": timezone,
        "timezone_abbreviation": timezoneAbbreviation,
        "elevation": elevation,
        "current_weather_units": currentWeatherUnits?.toJson(),
        "current_weather": currentWeather?.toJson(),
      };
}

class CurrentWeather {
  final String? time;
  final int? interval;
  final int? temperature;
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
    int? temperature,
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

  factory CurrentWeather.fromJson(Map<String, dynamic> json) => CurrentWeather(
        time: json["time"],
        interval: json["interval"],
        temperature: json["temperature"],
        windspeed: json["windspeed"]?.toDouble(),
        winddirection: json["winddirection"],
        isDay: json["is_day"],
        weathercode: json["weathercode"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "interval": interval,
        "temperature": temperature,
        "windspeed": windspeed,
        "winddirection": winddirection,
        "is_day": isDay,
        "weathercode": weathercode,
      };
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

  factory CurrentWeatherUnits.fromJson(Map<String, dynamic> json) =>
      CurrentWeatherUnits(
        time: json["time"],
        interval: json["interval"],
        temperature: json["temperature"],
        windspeed: json["windspeed"],
        winddirection: json["winddirection"],
        isDay: json["is_day"],
        weathercode: json["weathercode"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "interval": interval,
        "temperature": temperature,
        "windspeed": windspeed,
        "winddirection": winddirection,
        "is_day": isDay,
        "weathercode": weathercode,
      };
}
