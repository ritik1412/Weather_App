// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_day_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastdayModel _$ForecastdayModelFromJson(Map<String, dynamic> json) =>
    ForecastdayModel(
      date: json['date'] as String?,
      dateEpoch: json['dateEpoch'] as int?,
      day: json['day'] == null
          ? null
          : DayModel.fromJson(json['day'] as Map<String, dynamic>),
      astro: json['astro'] == null
          ? null
          : AstroModel.fromJson(json['astro'] as Map<String, dynamic>),
      hour: (json['hour'] as List<dynamic>?)
          ?.map((e) => HourModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastdayModelToJson(ForecastdayModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'dateEpoch': instance.dateEpoch,
      'day': instance.day,
      'astro': instance.astro,
      'hour': instance.hour,
    };
