// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood_sugar_level_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BloodSugarLevelDataImpl _$$BloodSugarLevelDataImplFromJson(
        Map<String, dynamic> json) =>
    _$BloodSugarLevelDataImpl(
      seq: (json['x'] as num).toInt(),
      level: (json['y'] as num).toInt(),
      dateTime: DateTime.parse(json['dt'] as String),
    );

Map<String, dynamic> _$$BloodSugarLevelDataImplToJson(
        _$BloodSugarLevelDataImpl instance) =>
    <String, dynamic>{
      'x': instance.seq,
      'y': instance.level,
      'dt': instance.dateTime.toIso8601String(),
    };
