// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Current _$CurrentFromJson(Map<String, dynamic> json) => Current(
      last_updated: json['last_updated'] as String?,
      temp_c: (json['temp_c'] as num?)?.toDouble(),
      temp_f: (json['temp_f'] as num?)?.toDouble(),
      is_day: json['is_day'] as int?,
      condition: json['condition'] == null
          ? null
          : Condition.fromJson(json['condition'] as Map<String, dynamic>),
      wind_mph: (json['wind_mph'] as num?)?.toDouble(),
      wind_kph: (json['wind_kph'] as num?)?.toDouble(),
      wind_degree: json['wind_degree'] as int?,
      wind_dir: json['wind_dir'] as String?,
      pressure_mb: (json['pressure_mb'] as num?)?.toDouble(),
      pressure_in: (json['pressure_in'] as num?)?.toDouble(),
      precip_mm: (json['precip_mm'] as num?)?.toDouble(),
      precip_in: (json['precip_in'] as num?)?.toDouble(),
      humidity: json['humidity'] as int?,
      cloud: json['cloud'] as int?,
      feelslike_c: (json['feelslike_c'] as num?)?.toDouble(),
      feelslike_f: (json['feelslike_f'] as num?)?.toDouble(),
      vis_km: (json['vis_km'] as num?)?.toDouble(),
      vis_miles: (json['vis_miles'] as num?)?.toDouble(),
      uv: (json['uv'] as num?)?.toDouble(),
      gust_mph: (json['gust_mph'] as num?)?.toDouble(),
      gust_kph: (json['gust_kph'] as num?)?.toDouble(),
      air_quality: json['air_quality'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CurrentToJson(Current instance) => <String, dynamic>{
      'last_updated': instance.last_updated,
      'temp_c': instance.temp_c,
      'temp_f': instance.temp_f,
      'is_day': instance.is_day,
      'condition': instance.condition,
      'wind_mph': instance.wind_mph,
      'wind_kph': instance.wind_kph,
      'wind_degree': instance.wind_degree,
      'wind_dir': instance.wind_dir,
      'pressure_mb': instance.pressure_mb,
      'pressure_in': instance.pressure_in,
      'precip_mm': instance.precip_mm,
      'precip_in': instance.precip_in,
      'humidity': instance.humidity,
      'cloud': instance.cloud,
      'feelslike_c': instance.feelslike_c,
      'feelslike_f': instance.feelslike_f,
      'vis_km': instance.vis_km,
      'vis_miles': instance.vis_miles,
      'uv': instance.uv,
      'gust_mph': instance.gust_mph,
      'gust_kph': instance.gust_kph,
      'air_quality': instance.air_quality,
    };
