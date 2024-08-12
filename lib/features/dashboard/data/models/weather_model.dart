class GetWeatherModel {
  final double? latitude;
  final double? longitude;
  final double? generationtimeMs;
  final int? utcOffsetSeconds;
  final String? timezone;
  final String? timezoneAbbreviation;
  final double? elevation;
  final CurrentWeatherUnitsModel? currentWeatherUnits;
  final CurrentWeatherModel? currentWeather;

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
    double? elevation, // Change to double
    CurrentWeatherUnitsModel? currentWeatherUnits,
    CurrentWeatherModel? currentWeather,
  }) =>
      GetWeatherModel(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        generationtimeMs: generationtimeMs ?? this.generationtimeMs,
        utcOffsetSeconds: utcOffsetSeconds ?? this.utcOffsetSeconds,
        timezone: timezone ?? this.timezone,
        timezoneAbbreviation: timezoneAbbreviation ?? this.timezoneAbbreviation,
        elevation: elevation ?? this.elevation, // Change to double
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
        elevation: json["elevation"]?.toDouble(), // Convert to double
        currentWeatherUnits: json["current_weather_units"] == null
            ? null
            : CurrentWeatherUnitsModel.fromJson(json["current_weather_units"]),
        currentWeather: json["current_weather"] == null
            ? null
            : CurrentWeatherModel.fromJson(json["current_weather"]),
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

class CurrentWeatherModel {
  final String? time;
  final int? interval;
  final double? temperature;
  final double? windspeed;
  final int? winddirection;
  final int? isDay;
  final int? weathercode;

  CurrentWeatherModel({
    this.time,
    this.interval,
    this.temperature,
    this.windspeed,
    this.winddirection,
    this.isDay,
    this.weathercode,
  });

  CurrentWeatherModel copyWith({
    String? time,
    int? interval,
    double? temperature, // Change to double
    double? windspeed, // Change to double
    int? winddirection,
    int? isDay,
    int? weathercode,
  }) =>
      CurrentWeatherModel(
        time: time ?? this.time,
        interval: interval ?? this.interval,
        temperature: temperature ?? this.temperature, // Change to double
        windspeed: windspeed ?? this.windspeed, // Change to double
        winddirection: winddirection ?? this.winddirection,
        isDay: isDay ?? this.isDay,
        weathercode: weathercode ?? this.weathercode,
      );

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) =>
      CurrentWeatherModel(
        time: json["time"],
        interval: json["interval"],
        temperature: json["temperature"]?.toDouble(), // Convert to double
        windspeed: json["windspeed"]?.toDouble(), // Convert to double
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

class CurrentWeatherUnitsModel {
  final String? time;
  final String? interval;
  final String? temperature;
  final String? windspeed;
  final String? winddirection;
  final String? isDay;
  final String? weathercode;

  CurrentWeatherUnitsModel({
    this.time,
    this.interval,
    this.temperature,
    this.windspeed,
    this.winddirection,
    this.isDay,
    this.weathercode,
  });

  CurrentWeatherUnitsModel copyWith({
    String? time,
    String? interval,
    String? temperature,
    String? windspeed,
    String? winddirection,
    String? isDay,
    String? weathercode,
  }) =>
      CurrentWeatherUnitsModel(
        time: time ?? this.time,
        interval: interval ?? this.interval,
        temperature: temperature ?? this.temperature,
        windspeed: windspeed ?? this.windspeed,
        winddirection: winddirection ?? this.winddirection,
        isDay: isDay ?? this.isDay,
        weathercode: weathercode ?? this.weathercode,
      );

  factory CurrentWeatherUnitsModel.fromJson(Map<String, dynamic> json) =>
      CurrentWeatherUnitsModel(
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
