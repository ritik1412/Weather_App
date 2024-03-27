// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'astro_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AstroModel _$AstroModelFromJson(Map<String, dynamic> json) => AstroModel(
      sunrise: json['sunrise'] as String?,
      sunset: json['sunset'] as String?,
      moonrise: json['moonrise'] as String?,
      moonset: json['moonset'] as String?,
      moon_phase: json['moon_phase'] as String?,
      moon_illumination: (json['moon_illumination'] as num?)?.toDouble(),
      isMoonUp: json['isMoonUp'] as int?,
      isSunUp: json['isSunUp'] as int?,
    );

Map<String, dynamic> _$AstroModelToJson(AstroModel instance) =>
    <String, dynamic>{
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'moonrise': instance.moonrise,
      'moonset': instance.moonset,
      'moon_phase': instance.moon_phase,
      'moon_illumination': instance.moon_illumination,
      'isMoonUp': instance.isMoonUp,
      'isSunUp': instance.isSunUp,
    };
