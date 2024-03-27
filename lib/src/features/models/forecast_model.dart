import 'package:json_annotation/json_annotation.dart';

import 'forecast_day_model.dart';
part 'forecast_model.g.dart';

@JsonSerializable()
class ForecastModel {
  List<ForecastdayModel>? forecastday;

  ForecastModel({this.forecastday});

  factory ForecastModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastModelToJson(this);
}
