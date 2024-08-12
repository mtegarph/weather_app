class CoordinateEntity {
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

  CoordinateEntity({
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

  CoordinateEntity copyWith({
    int? id,
    String? name,
    double? latitude,
    double? longitude,
    double? elevation,
    String? featureCode,
    String? countryCode,
    int? admin1Id,
    String? timezone,
    int? population,
    int? countryId,
    String? country,
    String? admin1,
  }) =>
      CoordinateEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        elevation: elevation ?? this.elevation,
        featureCode: featureCode ?? this.featureCode,
        countryCode: countryCode ?? this.countryCode,
        admin1Id: admin1Id ?? this.admin1Id,
        timezone: timezone ?? this.timezone,
        population: population ?? this.population,
        countryId: countryId ?? this.countryId,
        country: country ?? this.country,
        admin1: admin1 ?? this.admin1,
      );
}
