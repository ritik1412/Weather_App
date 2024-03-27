import 'package:json_annotation/json_annotation.dart';
part 'condition_model.g.dart';

@JsonSerializable()
class Condition {
  final String? text;

  final String? icon;

  final int? code;

  Condition({
    this.text,
    this.icon,
    this.code,
  });

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}
