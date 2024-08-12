class GetCoordinate {
  final List<Result>? results;
  final double? generationtimeMs;

  GetCoordinate({
    this.results,
    this.generationtimeMs,
  });

  factory GetCoordinate.fromJson(Map<String, dynamic> json) => GetCoordinate(
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
        generationtimeMs: json["generationtime_ms"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "generationtime_ms": generationtimeMs,
      };
}

class Result {
  final int? id;
  final String? name;
  final double? latitude;
  final double? longitude;
  final double? elevation;
  final String? featureCode;
  final String? countryCode;
  final int? admin1Id;
  final String? timezone;
  final int? population;
  final int? countryId;
  final String? country;
  final String? admin1;

  Result({
    this.id,
    this.name,
    this.latitude,
    this.longitude,
    this.elevation,
    this.featureCode,
    this.countryCode,
    this.admin1Id,
    this.timezone,
    this.population,
    this.countryId,
    this.country,
    this.admin1,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        elevation: json["elevation"],
        featureCode: json["feature_code"],
        countryCode: json["country_code"],
        admin1Id: json["admin1_id"],
        timezone: json["timezone"],
        population: json["population"],
        countryId: json["country_id"],
        country: json["country"],
        admin1: json["admin1"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
        "elevation": elevation,
        "feature_code": featureCode,
        "country_code": countryCode,
        "admin1_id": admin1Id,
        "timezone": timezone,
        "population": population,
        "country_id": countryId,
        "country": country,
        "admin1": admin1,
      };
}
