// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

import 'condition_model.dart';
part 'hour_model.g.dart';

@JsonSerializable()
class HourModel {
  int? time_epoch;

  String? time;

  double? temp_c;

  double? temp_f;

  int? is_day;

  Condition? condition;

  double? wind_mph;

  double? wind_kph;

  int? wind_degree;

  String? wind_dir;

  double? pressure_mb;

  double? pressure_in;

  double? precip_mm;

  double? precip_in;

  double? snow_cm;

  int? humidity;

  int? cloud;

  double? feelslike_c;

  double? feelslike_f;

  double? windchill_c;

  double? windchill_f;

  double? heatindex_c;

  double? heatindex_f;

  double? dewpoint_c;

  double? dewpoint_f;

  int? will_it_rain;

  int? chance_of_rain;

  int? will_it_snow;

  int? chance_of_snow;

  double? vis_km;

  double? vis_miles;

  double? gust_mph;

  double? gust_kph;

  double? uv;

  HourModel({
    this.chance_of_rain,
    this.chance_of_snow,
    this.cloud,
    this.condition,
    this.dewpoint_c,
    this.dewpoint_f,
    this.feelslike_c,
    this.feelslike_f,
    this.gust_kph,
    this.gust_mph,
    this.heatindex_c,
    this.heatindex_f,
    this.humidity,
    this.is_day,
    this.precip_in,
    this.precip_mm,
    this.pressure_in,
    this.pressure_mb,
    this.snow_cm,
    this.temp_c,
    this.temp_f,
    this.time,
    this.time_epoch,
    this.uv,
    this.vis_km,
    this.vis_miles,
    this.will_it_rain,
    this.will_it_snow,
    this.wind_degree,
    this.wind_dir,
    this.wind_kph,
    this.wind_mph,
    this.windchill_c,
    this.windchill_f,
  });

  factory HourModel.fromJson(Map<String, dynamic> json) =>
      _$HourModelFromJson(json);

  Map<String, dynamic> toJson() => _$HourModelToJson(this);
}
