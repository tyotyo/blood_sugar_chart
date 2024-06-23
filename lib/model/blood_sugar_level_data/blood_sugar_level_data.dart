import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'blood_sugar_level_data.g.dart';
part 'blood_sugar_level_data.freezed.dart';

@freezed
class BloodSugarLevelData with _$BloodSugarLevelData {
  const factory BloodSugarLevelData({
    @JsonKey(name: 'x') required int seq,
    @JsonKey(name: 'y') required int level,
    @JsonKey(name: 'dt') required DateTime dateTime,
  }) = _BloodSugarLevelData;

  factory BloodSugarLevelData.fromJson(Map<String, dynamic> json) =>
      _$BloodSugarLevelDataFromJson(json);
}
