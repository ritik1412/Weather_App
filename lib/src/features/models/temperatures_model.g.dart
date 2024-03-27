// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temperatures_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Temperatures _$TemperaturesFromJson(Map<String, dynamic> json) => Temperatures(
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      current: json['current'] == null
          ? null
          : Current.fromJson(json['current'] as Map<String, dynamic>),
      forecast: json['forecast'] == null
          ? null
          : ForecastModel.fromJson(json['forecast'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TemperaturesToJson(Temperatures instance) =>
    <String, dynamic>{
      'location': instance.location,
      'current': instance.current,
      'forecast': instance.forecast,
    };
