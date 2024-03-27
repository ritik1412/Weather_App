import 'package:json_annotation/json_annotation.dart';
part 'location_model.g.dart';

@JsonSerializable()
class Location {
  final String? name;

  final String? region;

  final String? country;

  final double? lat;

  final double? lon;

  final String? tzId;

  final String? localtime;

  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtime,
  });

  // Override == and hashCode methods
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Location &&
          runtimeType == other.runtimeType &&
          lat == other.lat &&
          lon == other.lon;

  @override
  int get hashCode => lat.hashCode ^ lon.hashCode;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
