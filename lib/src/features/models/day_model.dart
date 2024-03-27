// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

import 'condition_model.dart';
part 'day_model.g.dart';

@JsonSerializable()
class DayModel {
  double? maxtemp_c;
  double? maxtemp_f;
  double? mintemp_c;
  double? mintemp_f;
  double? avgtemp_c;
  double? avgtemp_f;
  double? maxwind_mph;
  double? maxwind_kph;
  double? totalprecip_mm;
  double? totalprecip_in;

  double? totalsnow_cm;

  double? avgvis_km;

  double? avgvis_miles;

  int? avghumidity;

  int? daily_will_it_rain;

  int? daily_chance_of_rain;

  int? daily_will_it_snow;

  int? daily_chance_of_snow;

  Condition? condition;

  double? uv;

  DayModel({
    this.avghumidity,
    this.avgtemp_c,
    this.avgtemp_f,
    this.avgvis_km,
    this.avgvis_miles,
    this.daily_chance_of_rain,
    this.condition,
    this.daily_chance_of_snow,
    this.daily_will_it_rain,
    this.daily_will_it_snow,
    this.maxtemp_c,
    this.maxtemp_f,
    this.maxwind_kph,
    this.maxwind_mph,
    this.mintemp_c,
    this.mintemp_f,
    this.totalprecip_in,
    this.totalprecip_mm,
    this.totalsnow_cm,
    this.uv,
  });

  factory DayModel.fromJson(Map<String, dynamic> json) =>
      _$DayModelFromJson(json);
  Map<String, dynamic> toJson() => _$DayModelToJson(this);
}
