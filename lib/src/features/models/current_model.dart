// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'condition_model.dart';
part 'current_model.g.dart';

@JsonSerializable()
class Current {
  final String? last_updated;

  final double? temp_c;

  final double? temp_f;

  final int? is_day;

  final Condition? condition;

  final double? wind_mph;

  final double? wind_kph;

  final int? wind_degree;

  final String? wind_dir;

  final double? pressure_mb;

  final double? pressure_in;

  final double? precip_mm;

  final double? precip_in;

  final int? humidity;

  final int? cloud;

  final double? feelslike_c;

  final double? feelslike_f;

  final double? vis_km;

  final double? vis_miles;

  final double? uv;

  final double? gust_mph;

  final double? gust_kph;

  final Map<String, dynamic>? air_quality;

  Current({
    this.last_updated,
    this.temp_c,
    this.temp_f,
    this.is_day,
    this.condition,
    this.wind_mph,
    this.wind_kph,
    this.wind_degree,
    this.wind_dir,
    this.pressure_mb,
    this.pressure_in,
    this.precip_mm,
    this.precip_in,
    this.humidity,
    this.cloud,
    this.feelslike_c,
    this.feelslike_f,
    this.vis_km,
    this.vis_miles,
    this.uv,
    this.gust_mph,
    this.gust_kph,
    this.air_quality,
  });

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentToJson(this);
}
