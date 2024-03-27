import 'package:json_annotation/json_annotation.dart';

import 'astro_model.dart';
import 'day_model.dart';
import 'hour_model.dart';
part 'forecast_day_model.g.dart';

@JsonSerializable()
class ForecastdayModel {
  String? date;

  int? dateEpoch;

  DayModel? day;

  AstroModel? astro;

  List<HourModel>? hour;

  ForecastdayModel({
    this.date,
    this.dateEpoch,
    this.day,
    this.astro,
    this.hour,
  });

  factory ForecastdayModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastdayModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastdayModelToJson(this);
}
