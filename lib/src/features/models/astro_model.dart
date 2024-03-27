// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
part 'astro_model.g.dart';

@JsonSerializable()
class AstroModel {
  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  String? moon_phase;
  double? moon_illumination;
  int? isMoonUp;
  int? isSunUp;

  AstroModel({
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moon_phase,
    this.moon_illumination,
    this.isMoonUp,
    this.isSunUp,
  });

  factory AstroModel.fromJson(Map<String, dynamic> json) =>
      _$AstroModelFromJson(json);

  Map<String, dynamic> toJson() => _$AstroModelToJson(this);
}
