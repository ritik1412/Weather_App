import 'package:json_annotation/json_annotation.dart';
import 'current_model.dart';
import 'forecast_model.dart';
import 'location_model.dart';
part 'temperatures_model.g.dart';

@JsonSerializable()
class Temperatures {
  final Location? location;

  final Current? current;

  final ForecastModel? forecast;

  Temperatures({
    this.location,
    this.current,
    this.forecast,
  });

  factory Temperatures.fromJson(Map<String, dynamic> json) =>
      _$TemperaturesFromJson(json);

  Map<String, dynamic> toJson() => _$TemperaturesToJson(this);
}
